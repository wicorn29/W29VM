@echo off
setlocal

rem Download the image
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/wicorn29/W29VM/refs/heads/main/Remote/Deploy/sms.png' -OutFile '%USERPROFILE%\Desktop\wallpaper.png'"

rem Set the wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%USERPROFILE%\Desktop\wallpaper.png" /f
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "2" /f
reg add "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0" /f

rem Refresh the wallpaper
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

rem Delete the downloaded image
del "%USERPROFILE%\Desktop\wallpaper.png"

endlocal
