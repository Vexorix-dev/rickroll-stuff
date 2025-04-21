@echo off
setlocal enabledelayedexpansion

rem Read and process the YAML file
for /f "tokens=* delims=" %%a in (commands.yaml) do (
    set "line=%%a"
    rem Ignore empty lines and the YAML key
    if "!line!" neq "" (
        echo !line! | find "commands:" >nul
        if errorlevel 1 (
            rem Execute the command and check if it fails
            call !line!
            if errorlevel 1 (
                rem If command fails, open the Rick Roll link
                start "" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
            )
        )
    )
)