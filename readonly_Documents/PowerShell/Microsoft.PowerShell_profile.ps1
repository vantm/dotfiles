# Import-Module -Name Terminal-Icons

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

$env:EDITOR="nvim"

function prompt {
    $segments = @()

    $is_git = "$(git rev-parse --is-inside-work-tree)" -eq "true"

    # userinfo
    $segments += "[$env:USERNAME@$env:COMPUTERNAME]"

    # git changes
    if ($true -eq $is_git) {
        $status = $(git status -s)
        $m = $(echo $status | ?{ $_ -like ' M*' } | measure -Line).Lines ?? 0
        $d = $(echo $status | ?{ $_ -like ' D*' } | measure -Line).Lines ?? 0
        $a = $(echo $status | ?{ $_ -like 'A *' } | measure -Line).Lines ?? 0
        $u = $(echo $status | ?{ $_ -like '`?`?*' } | measure -Line).Lines ?? 0
        $branch_name = $(git branch --show-current)

        $segments += "[`e[93m$u`? `e[92m$a+ `e[94m$m~ `e[91m$d-`e[39m @ `e[95m$branch_name`e[39m]"
    }

    # path
    $dir_path = "$pwd"
    if ($dir_path -eq $env:userprofile) {
        $dir_path = "~"
    }
    elseif ($dir_path.startswith($env:userprofile)) {
        $dir_path = $dir_path.replace($env:userprofile, "~")
    }
    $segments += $dir_path

    # join segments
    $segments_text = $segments -join ' '

    return "$segments_text`n$ "
}

function cmedit {
    chezmoi edit "~/$(chezmoi list -p relative -i files | fzf)"
}

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
    $jq = '.data.monitors.[]|' + `
	  '{hardwareId,hasFocus,children:([.children.[]|' + `
	  '{name,hasFocus,tilingDirection,children:([.children.[]|{id,title,className,processName,hasFocus}])}])}'
    glazewm query monitors | jq $jq
}

function Reset-WmWindows {
    glazewm query windows `
    | jq -c '.data.windows.[] | select(.state.type=="tiling" or .state.type=="fullscreen") | {title,processName,id}' `
    | ConvertFrom-Json `
    | %{ glazewm command --id $_.id set-tiling; write "Reset '$($_.title)'!" }
}

function nix { wsl -d NixOS }
function arch { wsl -d Arch }

Invoke-Expression (&{ zoxide init powershell | Out-String })
#Invoke-Expression (&{ kubectl completion powershell | Out-String })
#Invoke-Expression (&{ docker completion powershell | Out-String })
#Invoke-Expression (&{ helm completion powershell | Out-String })
#Invoke-Expression (&{ helmfile completion powershell | Out-String })
#Invoke-Expression (&{ gh completion -s powershell | Out-String })
#Invoke-Expression (&{ yq shell-completion powershell | Out-String })
#Invoke-Expression (&{ chezmoi completion powershell | Out-String })

#Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
#    param($wordToComplete, $commandAst, $cursorPosition)
#        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
#            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
#        }
#}

Import-Module -ErrorAction Ignore "$PSScriptRoot/PrivateFunctions.ps1"
