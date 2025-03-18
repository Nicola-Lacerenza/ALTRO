@echo off
cd /d "%~dp0"
echo Conversione da AVIF a JPG in corso...

:: Converte tutti i file .avif in .jpg
for %%f in (*.avif) do (
    ffmpeg -y -i "%%f" "%%~nf.jpg"
)

echo Creazione del video da immagini JPG...

:: Genera il video con risoluzione 1728x2160 e sfondo bianco
ffmpeg -y -framerate 15 -i "img%02d.jpg" -vf "scale=1728:2160:force_original_aspect_ratio=decrease,pad=1728:2160:(ow-iw)/2:(oh-ih)/2:white" -c:v libx264 -pix_fmt yuv420p output.mp4

echo Operazione completata!
pause
