@echo off

setlocal

for /f "tokens=1,* delims==" %%A in (Migrantfile.txt) do (
  set %%A=%%B
)

echo Unquoted: %var1%
echo   Quoted: %var2%

endlocal