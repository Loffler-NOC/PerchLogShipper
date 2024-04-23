# Define the URL to download the .EXE from
$downloadUrl = "https://cdn.perchsecurity.com/downloads/perch-log-shipper-latest.exe"

# Specify the token value
$Token = "$ENV:PerchToken"

# Define the local path to save the downloaded .EXE file
$downloadPath = ".\perch-log-shipper-latest.exe"

# Download the .EXE file
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

# Check if the download was successful
if (Test-Path $downloadPath) {
    # Run the .EXE with the specified arguments
    Start-Process -FilePath $downloadPath -ArgumentList "/qn", "OUTPUT=TOKEN", "VALUE=$Token" -Wait
} else {
    Write-Host "Failed to download the file from $downloadUrl"
}
