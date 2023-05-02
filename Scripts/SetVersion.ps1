# SetVersion by Mike Boynton

cls
$linefeed = "`n"

# Set path of "VariablesDefault.inc" file
$mypath = $MyInvocation.MyCommand.Path
$mypath = Split-Path $mypath -Parent
$mypath = Split-Path $mypath -Parent

# Extract app name
$app_name_position = $mypath.LastIndexOf("\") + 1
$app_name_position2 = $mypath.LastIndexOf("-")
$length = $app_name_position2 - $app_name_position
$app_name = $mypath.Substring($app_name_position,$length)

# Set path to variablesdefault.inc
$mypath = $mypath+"\Variables\"

# File to change
$file = $mypath + "VariablesDefault.inc"

# Set new version
$version = Get-Date -Format "yy.MMdd"

# Look for current Version. This works for any string that contains the string "version"
$find = (Get-Content "$file")  -match '(version)'

# Get current version
$position=$find.LastIndexOf("=")
$current_version = $find.Substring($position+1,7)

# "Version" not found, look for correct placement
$findline = Select-String -Path "$file" -Pattern "MyVariablesLoc" | Select-Object LineNumber
$SearchStart="="
$SearchEnd="}"
$findline -match "(?s)$SearchStart(?<content>.*)$SearchEnd"
[int]$findline=$matches['content']

# Add variable name "MyVersion" on the line below "MyVariablesLoc"
if (!$find) {
$find = "MyVersion="
(Get-Content "$file") 
$fileContents = Get-Content "$file"
$lineNumber = $findline
$textToAdd = $find 
$linefeed = "`n"
$fileContents[$lineNumber] += $textToAdd += $linefeed
$fileContents | Set-Content "$file"
}

# Find name of variable containing the string "version"
if ($find -like '*version*') { 

$string = $find
$string = $string -split "="
$string = $string[0]

}

# Set replacement string
$replace = $string + '='+ $version

# Confirm change of version
cls
Write-Host ""
Write-Host " Updating version number of $app_name" $linefeed $linefeed "Current version: $current_version" $linefeed "New Version: $version" $linefeed $linefeed "Do you want to update? " -NoNewLine
$confirmation = $Host.UI.ReadLine()
if ($confirmation -eq 'y') {

# Replace old version with new version and save
(Get-Content "$file") -Replace $find, $replace | Set-Content "$file"
}
