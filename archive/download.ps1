if ( $Args.Count -ne 2 ) {
  Write-Host "Error: Illegal number of parameters"
  Write-Host "$PSCommandPath <namespace> <box>"
  Write-Host "Example: $PSCommandPath hashicorp precise64"
  Exit 1
}

Set-Variable -Name "NS" -Value $Args[0]
Set-Variable -Name "BOX" -Value $Args[1]

Set-Variable -Name "API_DATE" -Value "2022-09-30"
# Set-Variable -Name "NS" -Value "hashicorp"
# ubuntu hashicorp generic
# Set-Variable -Name "BOX" -Value "bionic64"
# trusty64 bionic64 centos7
# Set-Variable -Name "VERSION" -Value "1.0.282"
#20191107.0.0 1.0.282 2004.01 4.3.12
Set-Variable -Name "PROVIDER" -Value "virtualbox"
# Set-Variable -Name "ARCH" -Value "unknown"
#amd64 i386

# Ensures that Invoke-WebRequest uses TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Main page for namespace.
Invoke-WebRequest -URI "https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS" | ConvertFrom-Json | ConvertTo-Json -Depth 4 | Out-File -FilePath "$NS-$BOX-1-registry.json"

# Main page for box (latest/current version).
Invoke-WebRequest -URI "https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX" | ConvertFrom-Json | ConvertTo-Json -Depth 4 | Out-File -FilePath "$NS-$BOX-2-current.json"

# List all box versions.
Invoke-WebRequest -URI "https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/versions" | ConvertFrom-Json | ConvertTo-Json -Depth 4 | Out-File -FilePath "$NS-$BOX-3-versions.json"
$json = Get-Content -Path "$NS-$BOX-3-versions.json" -Raw | ConvertFrom-Json
Set-Variable -Name "VERSION" -Value $json.versions[0].name
Write-Host "Found VERSION = $VERSION"

# List all providers and architectures for a particular version.
Invoke-WebRequest -URI "https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/version/$VERSION/providers" | ConvertFrom-Json | ConvertTo-Json -Depth 4 | Out-File -FilePath "$NS-$BOX-4-providers.json"
$json = Get-Content -Path "$NS-$BOX-4-providers.json" -Raw | ConvertFrom-Json
$json = $json.providers | Where-Object -Property name -EQ "virtualbox" | Select-Object -First 1 | ForEach-Object { $_.summary.architecture_types }  | Select-Object -First 1
# $json = $json.summary.architecture_types[0]
Set-Variable -Name "ARCH" -Value $json
Write-Host "Found ARCHITECTURE = $ARCH"

# Get the download URL.
Invoke-WebRequest -URI "https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/version/$VERSION/provider/$PROVIDER/architecture/$ARCH/download" | ConvertFrom-Json | ConvertTo-Json -Depth 4 | Out-File -FilePath "$NS-$BOX-5-download.json"
$json = Get-Content -Path "$NS-$BOX-5-download.json" -Raw | ConvertFrom-Json
Set-Variable -Name "URL" -Value $json.url
Write-Host "Found URL = $URL"

# Download the actual box.
# Invoke-WebRequest -URI $URL -OutFile "$NS-$BOX-$VERSION.box"

# Extract the .tar.gz box contents.
# New-Item -ItemType "Directory" -Path " .migrant.d\boxes\$NS-VAGRANTSLASH-$BOX\$VERSION\$ARCH" -Name "$PROVIDER"
# tar -xvzf $NS-$BOX-$VERSION.box -C .migrant.d\boxes\$NS-VAGRANTSLASH-$BOX\$VERSION\$ARCH\$PROVIDER

# Pretend that we checked the registry for update.
# New-Item -ItemType "File" -Name ".migrant.d\boxes\$NS-VAGRANTSLASH-$BOX\$VERSION\$ARCH\$PROVIDER\box_update_check"

# Create the metadata file with the box's source URL.
# As of 12 Mar 2025, the API version is "v2." This may change in future.
# "https://vagrantcloud.com/api/v2/vagrant/$NS/$BOX" | Out-File -FilePath ".migrant.d\boxes\$NS-VAGRANTSLASH-$BOX\metadata_url"
