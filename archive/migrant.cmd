@echo off

setlocal

goto :main

:read_config
for /f "tokens=1,* delims==" %%A in (Migrantfile.txt) do (
  set %%A=%%B
)
exit /b 0

:dump_config
echo config_vm_box: %config_vm_box%
echo config_vm_box_version: %config_vm_box_version%
exit /b 0

:init_home
set MIGRANT_HOME=.migrant.d
mkdir %MIGRANT_HOME%
mkdir %MIGRANT_HOME%\boxes
mkdir %MIGRANT_HOME%\data
mkdir %MIGRANT_HOME%\data\fp-leases
mkdir %MIGRANT_HOME%\data\machine-index
mkdir %MIGRANT_HOME%\gems
mkdir %MIGRANT_HOME%\insecure_private_keys
mkdir %MIGRANT_HOME%\rgloader
mkdir %MIGRANT_HOME%\tmp
echo 1.0 > %MIGRANT_HOME%\setup_version
usr\bin\curl -sSL -o %MIGRANT_HOME%\insecure_private_keys\vagrant.key.ed25519 https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.ed25519
usr\bin\curl -sSL -o %MIGRANT_HOME%\insecure_private_keys\vagrant.key.rsa https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.rsa
copy /y %MIGRANT_HOME%\insecure_private_keys\vagrant.key.rsa %MIGRANT_HOME%\insecure_private_key
exit /b 0

:main
call :read_config
call :dump_config
call :init_home
exit /b 0

endlocal