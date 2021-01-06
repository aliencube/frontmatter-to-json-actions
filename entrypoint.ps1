Param(
    [string]
    [Parameter(Mandatory=$true)]
    $Markdown
)

# Install PowerShell-Yaml module
Install-Module -Name powershell-yaml -Scope AllUsers -AllowClobber -Force

$Markdown

# # Extract frontmatter
# $md = $Markdown.Replace("\r", "`r").Replace("\n", "`n") -split ("---")

# $md

# if ($md[0] -eq "") {
#     $yaml = $md[1]
# } else {
#     $yaml = $md[0]
# }

Write-Output $yaml

# Convert frontmatter YAML to JSON
$deserialised = $yaml | ConvertFrom-Yaml

$deserialised

$jsonised = $deserialised | ConvertTo-Json -Compress

$jsonised

Write-Output "::set-output name=jsonised::$jsonised"

Remove-Variable jsonised
Remove-Variable deserialised
Remove-Variable yaml
Remove-Variable md
