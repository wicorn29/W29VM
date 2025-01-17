@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/wicorn29/W29VM/refs/heads/main/Remote/Deploy/sms.png' -OutFile '%USERPROFILE%\Desktop\wallpaper.png'; $regKey = 'HKCU:\Control Panel\Desktop'; $wallpaper = '%USERPROFILE%\Desktop\wallpaper.png'; Set-ItemProperty -Path $regKey -Name Wallpaper -Value $wallpaper; Set-ItemProperty -Path $regKey -Name WallpaperStyle -Value 2; Set-ItemProperty -Path $regKey -Name TileWallpaper -Value 0; RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters; Remove-Item '%USERPROFILE%\Desktop\wallpaper.png'"
exit
