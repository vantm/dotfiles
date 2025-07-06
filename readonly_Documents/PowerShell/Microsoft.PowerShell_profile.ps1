Import-Module -Name Terminal-Icons

Set-Alias -Name l -Value ls
Set-Alias -Name ll -Value ls
Set-Alias -Name k -Value kubectl
Set-Alias -Name h -Value helm
Set-Alias -Name ks -Value k9s
Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
Set-Alias -Name lg -Value lazygit
Set-Alias -Name fff -Value fastfetch

Set-PsReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor

Set-PSReadLineKeyHandler -Chord "ctrl+f" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "ctrl+k" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord "ctrl+j" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "ctrl+w" -Function BackwardDeleteWord
Set-PSReadLineKeyHandler -Chord "ctrl+p" -Function PreviousHistory
Set-PSReadLineKeyHandler -Chord "ctrl+n" -Function NextHistory

function forx {
    Param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [object[]]
        $paths,

        [Parameter(Mandatory,Position=2,ValueFromRemainingArguments)]
        [string]
        $cmd
    )

    Process {
        $paths | foreach-object -throttle 6 -parallel {
            pushd $_
            iex $using:cmd
        }
    }
}

function Test-Coverage {
    $output = $(dotnet test --collect:"XPlat Code Coverage")

    $id = $(select-string `
        -InputObject $output `
        -Pattern "TestResults\\([^\\]+)\\coverage.cobertura.xml" `
        -AllMatches).Matches.Groups[1].Value

    Write-Host $output

    reportgenerator.exe `
        -reporttypes:Html `
        -targetdir:".\TestResults\$id\report" `
        -reports:".\TestResults\$id\coverage.cobertura.xml";

    & ".\TestResults\$id\report\index.html";
}

function .. {
    cd ..
}

function ... {
    cd ../..
}

function Dotnet-Counters() {
    $process = $("$(dotnet counters ps | fzf --layout reverse)" -split " ")[1]
    if ("$process" -eq "") {
        return;
    }

    Write-Host "You selected $process"

    $counters = $(Read-Host -Prompt "Counters (optional)")

    if ("$counters" -eq "") {
        dotnet counters monitor -p $process --showDeltas
    }
    else {
        dotnet counters monitor -p $process --counters "System.Runtime,$counters" --showDeltas
    }
}

function Get-WmWindows {
    glazewm query windows | jq '.data.windows.[] | {className,processName,title}'
}

function Get-WmWorkspaces {
     glazewm query  workspaces | jq '.data.workspaces.[] | {name,hasFocus,tilingDirection}'
}

function Get-WmInfo {
    glazewm query monitors | jq '.data.monitors.[] | {hardwareId,hasFocus,children:([.children.[] | {name,hasFocus,tilingDirection,children:([.children.[]|{title,className,processName,hasFocus}])}])}'
}

Invoke-Expression (&{ zoxide init powershell | Out-String })
Invoke-Expression (&{ kubectl completion powershell | Out-String })
Invoke-Expression (&{ docker completion powershell | Out-String })
# Invoke-Expression (&{ helm completion powershell | Out-String })
Invoke-Expression (&{ helmfile completion powershell | Out-String })
Invoke-Expression (&{ gh completion -s powershell | Out-String })
Invoke-Expression (&{ yq shell-completion powershell | Out-String })
Invoke-Expression (&{ chezmoi completion powershell | Out-String })

Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

Import-Module "$PSScriptRoot/PrivateFunctions.ps1"
