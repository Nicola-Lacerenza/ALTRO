@echo off
echo Drag and drop il file .webm su questa finestra oppure inserisci il nome del file:
set /p input=
set output=%input:.webm=.mp4%

echo Convertendo %input% in %output%...
ffmpeg -i "%input%" -c:v libx264 -c:a aac "%output%"

echo Conversione completata! Il file è stato salvato come %output%.
pause
