@echo off
setlocal enabledelayedexpansion

echo Conversione di tutti i file AVIF in JPG nella cartella: %cd%
for %%F in (*.avif) do (
    echo Convertendo: %%F
    ffmpeg -i "%%F" -q:v 2 "%%~nF.jpg"
    if exist "%%~nF.jpg" (
        del "%%F"
        echo Eliminato: %%F
    )
)

echo Conversione completata!
pause
