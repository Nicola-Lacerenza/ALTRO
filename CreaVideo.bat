@echo off
setlocal enabledelayedexpansion

rem Set the base URL and destination folder
set "baseURL=https://images.stockx.com/360/Air-Jordan-4-Retro-OG-SP-A-Ma-Maniere-While-You-Were-Sleeping-Womens/Images/Air-Jordan-4-Retro-OG-SP-A-Ma-Maniere-While-You-Were-Sleeping-Womens/Lv2/"
set "destinationFolder=C:\Users\Emanuele Schino\Desktop\pippo"

rem Loop from 1 to 36
for /L %%i in (1, 1, 36) do (
    rem Format the image index to imgXX.jpg
    set "index=00%%i"
    set "index=!index:~-2!"

    rem Construct the full URL
    set "imageURL=!baseURL!img!index!.jpg?w=576&q=57&dpr=2&updated_at=1740417865&h=384"

    rem Download the image using curl (ensure curl is installed)
    curl -o "%destinationFolder%\img!index!.jpg" "!imageURL!"
)

cd /d "%~dp0"
echo Cartella di lavoro: %CD%

:: Verifica se ci sono immagini JPG
echo Verifica file JPG:
dir *.jpg

echo Creazione del video da immagini JPG...

:: Usa le virgolette doppie per gestire correttamente i percorsi con spazi e aumenta la qualità
ffmpeg -y -framerate 15 -start_number 1 -i "%CD%\img%%02d.jpg" -vf "scale=1728:2160:force_original_aspect_ratio=decrease,pad=1728:2160:(ow-iw)/2:(oh-ih)/2:white" -c:v libx264 -pix_fmt yuv420p -b:v 5000k -crf 20 -c:a aac -b:a 192k output.mp4

echo Creazione video completata!

:: Cancellazione delle immagini JPG
echo Cancellazione delle immagini...
del /q "%CD%\img*.jpg"

echo Immagini cancellate!
pause
