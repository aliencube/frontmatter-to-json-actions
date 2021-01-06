Param(
    [string]
    [Parameter(Mandatory=$true)]
    $Markdown
)

# Install PowerShell-Yaml module
Install-Module -Name powershell-yaml -Scope AllUsers -AllowClobber -Force

$Markdown

# Extract frontmatter
$md = $Markdown.Trim('"').Replace("\\r", "`r").Replace("\r", "`r").Replace("\\n", "`n").Replace("\n", "`n").Trim() -split ("---")

if ($md[0] -eq "") {
    Write-Output "md[1]: "
    $md[1]
    $yaml = $md[1].Trim()
} else {
    Write-Output "md[0]: "
    $md[0]
    $yaml = $md[0].Trim()
}

Write-Output "YAML:"
$yaml

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
