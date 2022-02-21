

# Aliases

if (!$(test-path alias:g)) {
  New-Alias -Name g -Value git -Description 'Alias for git command'
}

# Update Prompt
function prompt {
    $Success = $?
 
try {$gitBranch = git branch -q --show-current}
catch {$gitBranch = ''} 

    ## Time calculation
    $LastExecutionTimeSpan = if (@(Get-History).Count -gt 0) {
        Get-History | Select-Object -Last 1 | ForEach-Object {
            New-TimeSpan -Start $_.StartExecutionTime -End $_.EndExecutionTime
        }
    }
    else {
        New-TimeSpan
    }
 
    $LastExecutionShortTime = if ($LastExecutionTimeSpan.Days -gt 0) {
        "$($LastExecutionTimeSpan.Days + [Math]::Round($LastExecutionTimeSpan.Hours / 24, 2)) d"
    }
    elseif ($LastExecutionTimeSpan.Hours -gt 0) {
        "$($LastExecutionTimeSpan.Hours + [Math]::Round($LastExecutionTimeSpan.Minutes / 60, 2)) h"
    }
    elseif ($LastExecutionTimeSpan.Minutes -gt 0) {
        "$($LastExecutionTimeSpan.Minutes + [Math]::Round($LastExecutionTimeSpan.Seconds / 60, 2)) m"
    }
    elseif ($LastExecutionTimeSpan.Seconds -gt 0) {
        "$($LastExecutionTimeSpan.Seconds + [Math]::Round($LastExecutionTimeSpan.Milliseconds / 1000, 2)) s"
    }
    elseif ($LastExecutionTimeSpan.Milliseconds -gt 0) {
        "$([Math]::Round($LastExecutionTimeSpan.TotalMilliseconds, 2)) ms"
    }
    else {
        "0 s"
    }
 
    if ($Success) {
        Write-Host -Object "[$LastExecutionShortTime] " -NoNewline -ForegroundColor Green
    }
    else {
        Write-Host -Object "! [$LastExecutionShortTime] " -NoNewline -ForegroundColor Red
    }
 
    ## History ID
    $HistoryId = $MyInvocation.HistoryId
    # Uncomment below for leading zeros
    # $HistoryId = '{0:d4}' -f $MyInvocation.HistoryId
    Write-Host -Object "$HistoryId`: " -NoNewline -ForegroundColor Cyan
 
    ## User
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    Write-Host -Object "$($env:USERNAME) ($(if ($IsAdmin){ 'A' } else { 'U' })) " -NoNewline -ForegroundColor DarkRed
 
    ## Path
    $Drive = $pwd.Drive.Name
    $Pwds = $pwd -split "\\" | Where-Object { -Not [String]::IsNullOrEmpty($_) }
    $PwdPath = if ($Pwds.Count -gt 3) {
        $ParentFolder = Split-Path -Path (Split-Path -Path $pwd -Parent) -Leaf
        $CurrentFolder = Split-Path -Path $pwd -Leaf
        "..\$ParentFolder\$CurrentFolder"
    }
    elseif ($Pwds.Count -eq 3) {
        $ParentFolder = Split-Path -Path (Split-Path -Path $pwd -Parent) -Leaf
        $CurrentFolder = Split-Path -Path $pwd -Leaf
        "$ParentFolder\$CurrentFolder"
    }
    elseif ($Pwds.Count -eq 2) {
        Split-Path -Path $pwd -Leaf
    }
    else { "" }
 
    Write-Host -Object "$Drive`:\$PwdPath" -NoNewline -ForegroundColor Magenta

    Write-Host " | $gitBranch " -NoNewline -ForegroundColor Cyan
 
    return "> "
}

# Imports

try {
    . ("C:\_home\power-ranger-scripts\sql.ps1")
    . ("C:\_home\power-ranger-scripts\utils.ps1")
    . ("C:\_home\power-ranger-scripts\fileFunctions.ps1")
    . ("C:\_home\power-ranger-scripts\git.ps1")
    . ("C:\_home\power-ranger-scripts\elysiumFunctions.ps1")
    . ("C:\_home\power-ranger-scripts\gulp-tasks.ps1")
    . ("C:\_home\power-ranger-scripts\widgets.ps1")
#    . ("C:\_home\power-ranger-scripts\find_site_widgets.ps1")

}
catch {
    Write-Host "Error while loading supporting PowerShell Scripts" 
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


#fancy terminal stuff
oh-my-posh --init --shell pwsh --config ~/oh_my_posh.json | Invoke-Expression
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -EditMode Vi

$psReadLineVersion = [int]"$((Get-Module PSReadLine).Version.ToString())".Replace(".", "")
if ($psReadLineVersion -ge 210) {
      $promptChar = [char]0xe0b0
          $options = @{
                    PromptText = `
                                "`e[38;2;88;88;88m${promptChar}`e[0m ", `
                                            "`e[91m${promptChar}`e[0m " `
                                                        ;
                        }
          Set-PSReadLineOption @options
              Set-PSReadLineOption -ContinuationPrompt "`e[48;2;88;88;88m `e[0m`e[38;2;88;88;88m$([char]0xE0B0)`e[0m "

                  Set-PSReadLineOption -PredictionSource History
                      Set-PSReadLineKeyHandler -ViMode Insert -Chord "Ctrl+)" -Function AcceptNextSuggestionWord
}

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineKeyHandler -Chord "Ctrl+r" -ViMode Insert -Function ReverseSearchHistory
Set-PSReadLineKeyHandler -Chord "Ctrl+s" -ViMode Insert -Function ForwardSearchHistory

## As a matter of habit, remap $ and _ keys from French AZERTY layout
## to the new keys from the French AZERTY-NF layout

Set-PSReadLineKeyHandler -Key '+' -ViMode Command -Function MoveToEndOfLine
Set-PSReadLineKeyHandler -Key "’" -ViMode Command -Function GotoFirstNonBlankOfLine
