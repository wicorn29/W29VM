@echo off
REM Minimize the window
if not "%1"=="min" (
    start /min cmd /c "%~f0" min
    exit
)

REM Define the path where the script should be copied
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "scriptName=%~nx0"  REM This gets the name of the batch file
set "scriptPath=%startupFolder%\%scriptName%"

REM Check if the batch file already exists in the Startup folder
if not exist "%scriptPath%" (
    REM Copy the batch file to the Startup folder
    copy "%~f0" "%scriptPath%"
)

REM Specify the URL of the batch script to download
set "scriptUrl=https://raw.githubusercontent.com/wicorn29/W29VM/refs/heads/main/Remote/ExecuteOnBoot.bat"

REM Specify the local file name for the downloaded script
set "localScript=temp_script.bat"

REM Download the script using curl
curl -o %localScript% %scriptUrl%

REM Check if the download was successful
if exist %localScript% (
    REM Execute the downloaded script
    cls
    call %localScript%
    
    REM Clean up by deleting the temporary script file
    del %localScript%
) else (
    powershell -Command "Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.MessageBox]::Show('Failed to update W29 VM policies. Please check this VM has internet access, and then reboot it as soon as possible.', 'W29VM ERROR', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"
)

REM End the script
exit
