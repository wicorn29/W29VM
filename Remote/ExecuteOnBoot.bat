@echo off
set wallpaperUrl=https://raw.githubusercontent.com/wicorn29/W29VM/refs/heads/main/Remote/Deploy/sms.png
set wallpaperPath=%USERPROFILE%\Desktop\wallpaper.png

:: Download the image
powershell -Command "Invoke-WebRequest -Uri '%wallpaperUrl%' -OutFile '%wallpaperPath%'"

:: Set the wallpaper using registry changes
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaperPath%" /f
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "2" /f
reg add "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0" /f

:: Refresh the wallpaper
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Optionally delete the downloaded file
del "%wallpaperPath%"
