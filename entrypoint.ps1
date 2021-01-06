Param(
    [string]
    [Parameter(Mandatory=$true)]
    $Markdown
)

# Install PowerShell-Yaml module
Install-Module -Name powershell-yaml -Scope AllUsers -AllowClobber -Force

# Extract frontmatter
$md = $Markdown.Trim('"').Replace("\\r", "`r").Replace("\r", "`r").Replace("\\n", "`n").Replace("\n", "`n").Trim() -split ("---")

if ($md[0] -eq "") {
    $yaml = $md[1].Trim()
} else {
    $yaml = $md[0].Trim()
}

# Convert frontmatter YAML to JSON
$deserialised = $yaml | ConvertFrom-Yaml
$jsonised = $deserialised | ConvertTo-Json -Compress

Write-Output "::set-output name=jsonised::$jsonised"

Remove-Variable jsonised
Remove-Variable deserialised
Remove-Variable yaml
Remove-Variable md
