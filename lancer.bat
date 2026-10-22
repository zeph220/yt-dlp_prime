@echo off
set /p URL=Collez l'URL de la playlist puis Entree : 
if "%URL%"=="" (
    echo Aucune URL saisie.
    pause
    exit /b
)
"%~dp0yt-dlp.exe" -f bestaudio -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --convert-thumbnails jpg --ppa "EmbedThumbnail+ffmpeg_o:-c:v mjpeg -vf crop=\"if(gt(ih\,iw)\,iw\,ih):if(gt(iw\,ih)\,ih\,iw)\"" --embed-metadata --parse-metadata "playlist_index:%%(track_number)s" --ffmpeg-location "C:\Users\jeand\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-9.0.2-full_build\bin" --no-keep-video --yes-playlist -o "%%(playlist_title|Sans_playlist)s/%%(title)s.%%(ext)s" "%URL%"
echo.
echo Termine.
pause