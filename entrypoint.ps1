Param(
    [string]
    [Parameter(Mandatory=$true)]
    $Markdown
)

$md = $Markdown.Replace("\r", "`r").Replace("\n", "`n") -split ("---")

if ($md[0] -eq "") {
    $yaml = $md[1]
} else {
    $yaml = $md[0]
}

$deserialised = $yaml | ConvertFrom-Yaml
$jsonised = $deserialised | ConvertTo-Json -Compress

Write-Output "::set-output name=jsonised::$jsonised"

Remove-Variable jsonised
Remove-Variable deserialised
Remove-Variable yaml
Remove-Variable md
