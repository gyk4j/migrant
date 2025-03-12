@echo off

setlocal

if "%1" == "" goto illegal_number_parameters
if "%2" == "" goto illegal_number_parameters

set NS=%1
set BOX=%2

set API_DATE=2022-09-30
rem set NS=hashicorp
rem ubuntu hashicorp generic
rem set BOX=bionic64
rem trusty64 bionic64 centos7
rem set VERSION=1.0.282
rem 20191107.0.0 1.0.282 2004.01 4.3.12
set PROVIDER=virtualbox
rem set ARCH=unknown
rem amd64 i386

rem Main page for namespace.
curl -sS https://api.cloud.hashicorp.com/vagrant/%API_DATE%/registry/%NS% | jq "." > %NS%-%BOX%-1-registry.json

rem Main page for box (latest/current version).
curl -sS https://api.cloud.hashicorp.com/vagrant/%API_DATE%/registry/%NS%/box/%BOX% | jq "." > %NS%-%BOX%-2-current.json

rem List all box versions.
curl -sS https://api.cloud.hashicorp.com/vagrant/%API_DATE%/registry/%NS%/box/%BOX%/versions | jq "." > %NS%-%BOX%-3-versions.json
jq -r ".versions[0].name" %NS%-%BOX%-3-versions.json > VERSION.tmp
for /f "tokens=*" %%a in (VERSION.tmp) do (
  set VERSION=%%a
)
del VERSION.tmp
echo Found VERSION = %VERSION%

if "%VERSION%" == "" goto end

rem List all providers and architectures for a particular version.
curl -sS https://api.cloud.hashicorp.com/vagrant/%API_DATE%/registry/%NS%/box/%BOX%/version/%VERSION%/providers | jq "." > %NS%-%BOX%-4-providers.json
jq -r ".providers[] | select(.name == \"virtualbox\") | .summary.architecture_types[0]" %NS%-%BOX%-4-providers.json > ARCH.tmp
for /f "tokens=*" %%a in (ARCH.tmp) do (
  set ARCH=%%a
)
del ARCH.tmp
echo Found ARCHITECTURE = %ARCH%

if "%ARCH%" == "" goto end

rem Get the download URL.
curl -sS https://api.cloud.hashicorp.com/vagrant/%API_DATE%/registry/%NS%/box/%BOX%/version/%VERSION%/provider/%PROVIDER%/architecture/%ARCH%/download | jq "." > %NS%-%BOX%-5-download.json
jq -r ".url" %NS%-%BOX%-5-download.json > URL.tmp
for /f "tokens=*" %%a in (URL.tmp) do (
  set URL=%%a
)
del URL.tmp
echo Found URL = %URL%

if "%URL%" == "" goto end

rem Download the actual box.
rem curl -sSL -o %NS%-%BOX%-%VERSION%.box %URL%

rem Extract the .tar.gz box contents.
rem mkdir .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%
rem mkdir .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\%VERSION%
rem mkdir .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\%VERSION%\%ARCH%
rem mkdir .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\%VERSION%\%ARCH%\%PROVIDER%
rem tar -xvzf %NS%-%BOX%-%VERSION%.box -C .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\%VERSION%\%ARCH%\%PROVIDER%

rem Pretend that we checked the registry for update.
rem type NUL > .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\%VERSION%\%ARCH%\%PROVIDER%\box_update_check

rem Create the metadata file with the box's source URL.
rem As of 12 Mar 2025, the API version is "v2." This may change in future.
rem echo https://vagrantcloud.com/api/v2/vagrant/%NS%/%BOX% > .migrant.d\boxes\%NS%-VAGRANTSLASH-%BOX%\metadata_url

goto end

:illegal_number_parameters
echo Error: Illegal number of parameters
echo %0 ^<namespace^> ^<box^>
echo Example: %0 hashicorp precise64
goto end

:end
endlocal