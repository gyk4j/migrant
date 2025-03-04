function Read-Config {
  foreach($line in Get-Content .\Migrantfile.txt) {
    #echo $line
    $key, $value = $line -split '=', 2
    Set-Variable -Name "$key" -Value "$value" -Scope script
  }
}

function Dump-Config {
  Write-Output "config_vm_box: $config_vm_box"
  Write-Output "config_vm_box_version: $config_vm_box_version"
}

function Init-Home {
  Set-Variable -Name "MIGRANT_HOME" -Value ".migrant.d" -Scope script
  "boxes", "data", "gems", "insecure_private_keys", "rgloader,tmp" | ForEach-Object { New-Item -ItemType Directory -Path "$MIGRANT_HOME\$_" -Force } | Out-Null
  "fp-leases", "machine-index" | ForEach-Object { New-Item -ItemType Directory -Path "$MIGRANT_HOME\data\$_" -Force } | Out-Null
  "1.0" | Out-File -FilePath "$MIGRANT_HOME\setup_version"
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest -Uri "https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.ed25519" -OutFile "$MIGRANT_HOME\insecure_private_keys\vagrant.key.ed25519"
  Invoke-WebRequest -Uri "https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.rsa" -OutFile "$MIGRANT_HOME\insecure_private_keys\vagrant.key.rsa"
  Copy-Item -Path "$MIGRANT_HOME\insecure_private_keys\vagrant.key.rsa" -Destination "$MIGRANT_HOME\insecure_private_key"
}

function Main {
  Read-Config
  Dump-Config
  Init-Home
}

Main