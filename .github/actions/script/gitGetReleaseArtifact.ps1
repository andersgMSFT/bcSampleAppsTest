param(
    [string]$repo = "bcSampleAppsTest",
    [string]$owner = "andersgMSFT"
)

Write-Host "Getting latest release from GitHub";
$response = Invoke-WebRequest -Uri https://api.github.com/repos/$owner/$repo/releases/latest

Write-Host "Getting download URL for solutions.zip";
$downloadUrl = ($response.Content | ConvertFrom-Json).assets | Where-Object { $_.name -eq "BcSampleAppsSolution_0.0.0.1.zip" } | Select-Object -ExpandProperty browser_download_url

write-host "Downloading: " $downloadUrl;
Invoke-WebRequest -Uri $downloadUrl -OutFile solutions.zip