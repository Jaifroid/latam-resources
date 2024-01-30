param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$directory
)

# CD to the Repo directory
cd $PSScriptRoot\..

Get-ChildItem -Path $directory -Include *.html,*.htm -Recurse | ForEach-Object {
    $sourceFile = $_.FullName
    $targetFile = $_.FullName

    $reader = New-Object System.IO.StreamReader($sourceFile, [System.Text.Encoding]::GetEncoding('iso-8859-1'))
    $content = $reader.ReadToEnd()
    $reader.Close()
    Set-Content -Path $targetFile -Value $content -Encoding UTF8
}