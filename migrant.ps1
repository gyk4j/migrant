function Read-Config {
  foreach($line in Get-Content .\Migrantfile.txt) {
    #echo $line
    $key, $value = $line -split '=', 2
    Set-Variable -Name "$key" -Value "$value" -Scope script
  }
}

function Dump-Config {
  Write-Output "Unquoted: $var1"
  Write-Output "  Quoted: $var2"
}

function Main {
  Read-Config
  Dump-Config
}

Main