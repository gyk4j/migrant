foreach($line in Get-Content .\Migrantfile.txt) {
  #echo $line
  $key, $value = $line -split '=', 2
  Set-Variable -Name "$key" -Value "$value"
}

Write-Output "Unquoted: $var1"
Write-Output "  Quoted: $var2"
