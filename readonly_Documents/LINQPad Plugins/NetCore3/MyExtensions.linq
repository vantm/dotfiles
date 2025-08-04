<Query Kind="Program">
  <Namespace>System.Threading.Tasks</Namespace>
  <Namespace>System.Threading.Channels</Namespace>
</Query>

async Task Main()
{
    // Write code to test your extensions here. Press F5 to compile and run.

    await PlantUMLSample.RunAsync();
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