<Query Kind="Program">
  <Namespace>System.Threading.Tasks</Namespace>
  <Namespace>System.Threading.Channels</Namespace>
</Query>

async Task Main()
{
    // Write code to test your extensions here. Press F5 to compile and run.

    //await PlantUMLSample.RunAsync();

    LpServiceBusSample.Run();
}

static class PlantUMLSample
{
    public static async Task RunAsync()
    {
        LINQPad.Controls.TextArea textArea = new();
        LINQPad.Controls.Image img = new();

        LINQPad.Controls.Div div = new();
        div.Styles["display"] = "flex";
        div.Styles["gap"] = "10px";

        div.Children.Add(textArea);
        div.Children.Add(img);

        div.Dump();

        textArea.Text = Util.LoadString("myextensions-sample-plantuml-text");

        var channel = Channel.CreateBounded<string>(100);

        if (textArea.Text.Length > 0)
        {
            await channel.Writer.WriteAsync(textArea.Text);
        }

        textArea.TextInput += (_, _) =>
        {
            channel.Writer.WriteAsync(textArea.Text);
        };

        CancellationTokenSource? cts = null;

        await foreach (var text in channel.Reader.ReadAllAsync())
        {
            cts?.Cancel();
            cts?.Dispose();
            cts = new();

            _ = Task.Delay(500, cts.Token)
                .ContinueWith(async t =>
                {
                    if (t.IsCompletedSuccessfully)
                    {
                        try
                        {
                            var image = await text.GetPlantUMLAsync(cts.Token);

                            img.ImageData = image;

                            textArea.Styles["outline"] = null;
                            textArea.Styles["border"] = null;

                            Util.SaveString("myextensions-sample-plantuml-text", text);
                        }
                        catch (Exception ex)
                        {
                            textArea.Styles["outline"] = "1px solid red";
                            textArea.Styles["border"] = "1px solid red";
                        }
                    }

                }, TaskScheduler.Default);
        }
    }
}

static class LpServiceBusSample
{
    public static void Run()
    {
        var sb = new LpServiceBus();

        var sub = sb.SubscribeFactory(() => new MyOrderPlacedConsumer());
        sb.SubscribeConsumers<MySecondOrderPlacedConsumer>(123);

        var e = new OrderPlaced(Guid.NewGuid());

        sb.Publish(e);

        sb.Unsubscribe(sub);

        sb.Publish(e);
    }

    public record OrderPlaced(Guid OrderId);


    public class MyOrderPlacedConsumer : ILpConsumer<OrderPlaced>
    {
        public void Handle(OrderPlaced evt)
        {
            evt.Dump(GetType().FullName + " handles an event");
        }
    }

    public class MySecondOrderPlacedConsumer(int a) : ILpConsumer<OrderPlaced>
    {
        public void Handle(OrderPlaced evt)
        {
            evt.Dump(GetType().FullName + " handles an event");
        }
    }
}

public static class MyExtensions
{
    // Write custom extension methods here. They will be available to all queries.

    public static async Task<System.Drawing.Image> GetPlantUMLAsync(this string plantUmlCode, CancellationToken token = default)
    {
        var hostAndPort = Util.Cache(() =>
        {
            var (hostAndPort, error) = FindPlantUmlDockerUrl();

            if (error != null)
            {
                throw new InvalidOperationException(error);
            }

            return hostAndPort;
        }, "plantuml-server-host-and-port", TimeSpan.FromMinutes(3), false);

        var http = new System.Net.Http.HttpClient()
        {
            BaseAddress = new($"http://{hostAndPort}")
        };

        plantUmlCode = plantUmlCode.Trim();
        if (!plantUmlCode.StartsWith("@startuml"))
        {
            plantUmlCode = $"@startuml\n{plantUmlCode}\n@enduml";
        }

        var res = await http.PostAsync("/coder", new System.Net.Http.StringContent(plantUmlCode));

        res.EnsureSuccessStatusCode();

        var coder = await res.Content.ReadAsStringAsync(token);

        var buffer = await http.GetByteArrayAsync($"/png/{coder}", token);

        using var mem = new MemoryStream(buffer);

        return System.Drawing.Image.FromStream(mem);
    }

    private static (string, string?) FindPlantUmlDockerUrl(int depth = 0)
    {
        string[] lines = [.. Util.Cmd("docker ps -a", quiet: true)];
        if (lines[0].StartsWith("error during connect"))
        {
            return (string.Empty, "Docker have not started.");
        }

        var server = lines.FirstOrDefault(l => l.Contains("plantuml/plantuml-server"));
        if (server == null)
        {
            if (depth > 0)
            {
                return (string.Empty, "It cannot start a PlantUML server. Please manually started then try again.");
            }

            Util.Cmd("docker run -d -p 8080:8080 plantuml/plantuml-server:jetty", quiet: true);

            Thread.Sleep(500); // trick! wait for contaier to be ready.

            return FindPlantUmlDockerUrl(depth + 1);
        }

        var id = server.Split(" ", 2, StringSplitOptions.RemoveEmptyEntries)[0];
        var text = String.Join(" ", Util.Cmd("docker inspect " + id, quiet: true));
        var json = System.Text.Json.JsonDocument.Parse(text);

        var isRunning = json.RootElement[0].GetProperty("State").GetProperty("Running").GetBoolean();
        if (!isRunning)
        {
            Util.Cmd("docker start " + id, quiet: true);
        }

        var bindings = json.RootElement[0].GetProperty("HostConfig").GetProperty("PortBindings").EnumerateObject();

        string? hostAndPort = null;

        foreach (var binding in bindings)
        {
            if (!binding.Name.EndsWith("/tcp"))
            {
                continue;
            }

            var containerPort = int.Parse(binding.Name.Replace("/tcp", string.Empty).Trim());

            foreach (var hostPort in binding.Value.EnumerateArray())
            {
                var ip = hostPort.GetProperty("HostIp").GetString()!.Trim();
                var port = int.Parse(hostPort.GetProperty("HostPort").GetString()!);

                if (ip == string.Empty)
                {
                    ip = "localhost";
                }

                hostAndPort = $"{ip}:{port}";
            }
        }

        if (hostAndPort == null)
        {
            return (string.Empty, "PlantUML server may not be published");
        }


        return (hostAndPort, null);
    }

    public static Func<Task> Debounce(this Func<CancellationToken, Task> func, int milliseconds = 300)
    {
        CancellationTokenSource? cancelTokenSource = null;

        return async () =>
        {
            cancelTokenSource?.Cancel();
            cancelTokenSource = new CancellationTokenSource();

            await Task.Delay(milliseconds, cancelTokenSource.Token);
            await func(cancelTokenSource.Token);

            cancelTokenSource?.Dispose();
            cancelTokenSource = null;
        };
    }
}

public interface ILpConsumer<T>
{
    void Handle(T evt);
}

public record LpFailed<T>(Exception Exception, T Event);

public class LpServiceBus
{

    private sealed class DelegateConsumer<T>(Action<T> action) : ILpConsumer<T>
    {
        public void Handle(T evt)
        {
            action.Invoke(evt);
        }
    }

    private Dictionary<Type, List<(Guid SubscriptionId, Func<object> Factory)>> _map = [];
    public List<object> _deadLetters =[];

    public Guid SubscribeDelegate<T>(Action<T> action)
    {
        return SubscribeFactory<T>(() => new DelegateConsumer<T>(action));
    }

    public Guid SubscribeFactory<T>(Func<ILpConsumer<T>> factory)
    {
        var subscriptionId = Guid.NewGuid();
        if (_map.ContainsKey(typeof(T)))
        {
            _map[typeof(T)].Add((subscriptionId, factory));
        }
        else
        {
            _map.Add(typeof(T), [(subscriptionId, factory)]);
        }
        return subscriptionId;
    }

    public IEnumerable<(Type, Guid)> SubscribeConsumers<T>(params object[] parameters)
    {
        var interfaces = typeof(T).GetInterfaces();
        var consumerInterfaces = interfaces.Where(i => i.IsGenericType && i.GetGenericTypeDefinition() == typeof(ILpConsumer<>)).ToArray();
        var parameterTypes = parameters?.Select(p => p.GetType()).ToArray() ?? [];

        Debug.Assert(consumerInterfaces.Length > 0, $"The consumer must be inherited from {nameof(ILpConsumer<>)}");
        Debug.Assert(
            typeof(T).GetConstructor(BindingFlags.Public | BindingFlags.Instance, types: parameterTypes) != null,
            $"The consumer must have the constructor({string.Join(", ", parameterTypes.Select(t => t.FullName))}).");

        var subscriptions = new List<(Type, Guid)>();
        foreach (var consumerInterface in consumerInterfaces)
        {
            var eventType = consumerInterface.GetGenericArguments()[0];
            var subscriptionId = Guid.NewGuid();
            var factory = () => Activator.CreateInstance(typeof(T), parameters);

            if (_map.ContainsKey(eventType))
            {
                _map[eventType].Add((subscriptionId, factory));
            }
            else
            {
                _map.Add(eventType, [(subscriptionId, factory)]);
            }
            subscriptions.Add((eventType, subscriptionId));
        }
        return subscriptions;
    }

    public void Publish(object @event)
    {
        Debug.Assert(@event is not null, "The event must not be null");
        var eventType = @event.GetType();

        if (!_map.ContainsKey(eventType))
        {
            _deadLetters.Add(@event);
            return;
        }

        var method = typeof(ILpConsumer<>).MakeGenericType(eventType)
            .GetMethod("Handle", BindingFlags.Instance | BindingFlags.Public, types: [eventType]);

        foreach (var (_, consumerFactory) in _map[eventType])
        {
            var consumer = consumerFactory();

            Debug.Assert(consumer != null, "Cosumer must not be null.");

            try
            {
                method.Invoke(consumer, [@event]);
            }
            catch (Exception ex)
            {
                var failedEvent = Activator.CreateInstance(
                    typeof(LpFailed<>).MakeGenericType(eventType), ex, @event);

                Publish(failedEvent);
            }
        }
    }

    public void Unsubscribe(Guid subscriptionId)
    {
        foreach (var item in _map)
        {
            item.Value.RemoveAll(x => x.SubscriptionId == subscriptionId);
        }
    }
}

// You can also define namespaces, non-static classes, enums, etc.

#region Advanced - How to multi-target

// The NETx symbol is active when a script runs under .NET x or later.
// (LINQPad also recognizes NETx_0_OR_GREATER in case you enjoy typing.)

#if NET9
// Code that requires .NET 9 or later
#endif

#if NET8
// Code that requires .NET 8 or later
#endif

#if NET7
// Code that requires .NET 7 or later
#endif

#if NET6
// Code that requires .NET 6 or later
#endif

#if NETCORE
// Code that requires .NET Core or later
#else
// Code that runs under .NET Framework (LINQPad 5)
#endif

// The following symbols are also defined:
// WINDOWS              - when running under Microsoft Windows
// OSX, MACOS, UNIX     - when running under macOS
// CMD                  - when running under the command-line (lprun).

#endregion