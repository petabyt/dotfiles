@echo off
REM Use vswhere to find the path to devenv.exe
for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.Component.MSBuild -find **\devenv.exe`) do set devenvPath=%%i

REM Check if devenv.exe was found
if "%devenvPath%"=="" (
    echo Visual Studio not found.
    exit /b 1
)

REM Run devenv with the /debug flag and any additional arguments passed to the script
"%devenvPath%" /debugexe %*
