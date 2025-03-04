@echo off

setlocal

goto :main

:read_config
for /f "tokens=1,* delims==" %%A in (Migrantfile.txt) do (
  set %%A=%%B
)
exit /b 0

:dump_config
echo Unquoted: %var1%
echo   Quoted: %var2%
exit /b 0

:main
call :read_config
call :dump_config
exit /b 0

endlocal