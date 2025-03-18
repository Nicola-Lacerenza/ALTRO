@echo off
setlocal enabledelayedexpansion

rem Set the base URL and destination folder
set "baseURL=https://images.stockx.com/360/Air-Jordan-4-Retro-SB-Navy/Images/Air-Jordan-4-Retro-SB-Navy/Lv2/"
set "destinationFolder=C:\Users\nicol\Desktop\immagini\VIDEO"

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

echo Download complete!
pause
