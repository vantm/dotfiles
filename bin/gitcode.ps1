[CmdletBinding()]
param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)] $GitArgs
)

$DisableExtensions = code --list-extensions | ?{ $_ -ne "vscodevim.vim" }
$DisableExtensionArgs = [String]::Join(' ', ($DisableExtensions | %{ "--disable-extension $_ " }))
Invoke-Expression "code --new-window $DisableExtensionArgs $GitArgs"
