param(
    [string]$repo,
    [string]$owner
)

Write-Host "Getting latest release from GitHub";
$response = Invoke-WebRequest -Uri https://api.github.com/repos/$owner/$repo/releases/latest

Write-Host "Getting download URL for solutions.zip";
$downloadUrl = ($response.Content | ConvertFrom-Json).assets | Where-Object { $_.name -eq "solutions.zip" } | Select-Object -ExpandProperty browser_download_url

write-host "Downloading solutions.zip";
Invoke-WebRequest -Uri $downloadUrl -OutFile solutions.zip