@echo off
set /p "img_path=Inserisci il percorso dell'immagine: "
set "output_path=%~dp1padded_%~n1.png"

:: Aggiungi sfondo bianco e crea l'immagine ridimensionata
ffmpeg -i "%img_path%" -vf "scale='if(gt(iw/ih,1728/2160),1728,-1)':'if(gt(iw/ih,1728/2160),-1,2160)', pad=1728:2160:(1728-iw)/2:(2160-ih)/2:white" "%output_path%"

:: Cancella il file originale
del "%img_path%"

:: Rinomina l'immagine con sfondo bianco per sostituire quella originale
ren "%output_path%" "%~nx1"

echo Immagine sostituita con successo! Il file originale è stato rimosso.
pause
