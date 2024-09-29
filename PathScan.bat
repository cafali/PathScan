@echo off
title PathScan

setlocal enabledelayedexpansion

:restart
::: github.com/cafali/pathscan
::: ______     _   _     _____                  
::: | ___ \   | | | |   /  ___|                
::: | |_/ /_ _| |_| |__ \ `--.  ___ __ _ _ __  
::: |  __/ _` | __| '_ \ `--. \/ __/ _` | '_ \ 
::: | | | (_| | |_| | | /\__/ / (_| (_| | | | |
::: \_|  \__,_|\__|_| |_\____/ \___\__,_|_| |_| v.1.0.0

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

:: get hostname
for /f "delims=" %%h in ('hostname') do set "hostname=%%h"

:: get current date and time
for /f "tokens=1-3 delims=/ " %%d in ("%date%") do (
    set "day=%%d"
    set "month=%%e"
    set "year=%%f"
)

for /f "tokens=1-3 delims=:" %%a in ("%time%") do (
    set "hour=%%a"
    set "minute=%%b"
    set "second=%%c"
)

:: remove any fractional seconds (if present)
for /f "tokens=1 delims=," %%s in ("!second!") do set "second=%%s"

:: remove leading spaces from hour, minute, and second variables
set "hour=!hour: =!"
set "minute=!minute: =!"
set "second=!second: =!"

:: format date and time for output
set "formatted_date=%year%-%month%-%day%"
set "formatted_time=!hour!-!minute!-!second!"

:: define output folder path on the Desktop
set "output_folder=%USERPROFILE%\Desktop\PathScan"

:: check if the PathScan folder exists, create it if it doesn't
if not exist "%output_folder%" (
    mkdir "%output_folder%"
)

:menu
echo.
echo =========================================
echo Commands:
echo =========================================
echo an - Analyze Output File
echo cc - Check Connected Drives
echo cd - Scan Current Directory
echo.
echo For a Full Hard Drive Scan - SELECT any DRIVE LETTER 
echo (e.g - "C" for C:\ drive)
echo =========================================
echo.
set /p "choice=Enter your selection: "

:: drive status
if /I "%choice%"=="cc" (
    echo.
    echo Connected Drives:
    echo.
    set "online_found=0"
    for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if exist %%D:\ (
            echo %%D:\ - Online
            set "online_found=1"
        )
    )
    if !online_found! equ 0 (
        echo No drives are currently online.
    )
    echo.
    echo Press ANY KEY to RETURN to SELECTION
    pause > nul
    cls
    goto restart
)

:: analyze output file
if /I "%choice%"=="an" (
    goto :analyze
)

:: drive choice
if /I "%choice%"=="cd" (
    set "folder=%cd%"
    for %%f in ("%folder%") do set "folder_name=%%~nxf"
) else if /I "%choice%"=="C" (
    set "folder=C:\"
    set "folder_name=C_Drive"
) else if /I "%choice%"=="D" (
    set "folder=D:\"
    set "folder_name=D_Drive"
) else if /I "%choice%"=="E" (
    set "folder=E:\"
    set "folder_name=E_Drive"
) else if /I "%choice%"=="F" (
    set "folder=F:\"
    set "folder_name=F_Drive"
) else if /I "%choice%"=="G" (
    set "folder=G:\"
    set "folder_name=G_Drive"
) else if /I "%choice%"=="H" (
    set "folder=H:\"
    set "folder_name=H_Drive"
) else if /I "%choice%"=="I" (
    set "folder=I:\"
    set "folder_name=I_Drive"
) else if /I "%choice%"=="J" (
    set "folder=J:\"
    set "folder_name=J_Drive"
) else if /I "%choice%"=="K" (
    set "folder=K:\"
    set "folder_name=K_Drive"
) else if /I "%choice%"=="L" (
    set "folder=L:\"
    set "folder_name=L_Drive"
) else if /I "%choice%"=="M" (
    set "folder=M:\"
    set "folder_name=M_Drive"
) else if /I "%choice%"=="N" (
    set "folder=N:\"
    set "folder_name=N_Drive"
) else if /I "%choice%"=="O" (
    set "folder=O:\"
    set "folder_name=O_Drive"
) else if /I "%choice%"=="P" (
    set "folder=P:\"
    set "folder_name=P_Drive"
) else if /I "%choice%"=="Q" (
    set "folder=Q:\"
    set "folder_name=Q_Drive"
) else if /I "%choice%"=="R" (
    set "folder=R:\"
    set "folder_name=R_Drive"
) else if /I "%choice%"=="S" (
    set "folder=S:\"
    set "folder_name=S_Drive"
) else if /I "%choice%"=="T" (
    set "folder=T:\"
    set "folder_name=T_Drive"
) else if /I "%choice%"=="U" (
    set "folder=U:\"
    set "folder_name=U_Drive"
) else if /I "%choice%"=="V" (
    set "folder=V:\"
    set "folder_name=V_Drive"
) else if /I "%choice%"=="W" (
    set "folder=W:\"
    set "folder_name=W_Drive"
) else if /I "%choice%"=="X" (
    set "folder=X:\"
    set "folder_name=X_Drive"
) else if /I "%choice%"=="Y" (
    set "folder=Y:\"
    set "folder_name=Y_Drive"
) else if /I "%choice%"=="Z" (
    set "folder=Z:\"
    set "folder_name=Z_Drive"
) else (
    echo Invalid selection. Please try again.
    pause
    cls
    goto restart
)

:: check if the directory exists for the current directory selection
if "%choice%"=="0" (
    if not exist "%folder%" (
        echo.
        echo Error: Current directory "%folder%" is not available.
        pause
        goto restart
    )
)

:: check if the selected drive exists
if not exist "%folder%" (
    echo.
    echo Error: Drive "%folder%" is not available or connected.
    pause
    goto menu
)

:: define output file path in the PathScan folder
if "%choice%"=="cd" (
    for %%f in ("%folder%") do set "folder_name=%%~nxf"
)

set "output_file=%output_folder%\%folder_name%_PathScan_%formatted_date%_%formatted_time%.txt"

:: notify - start of the process
echo.
echo ===================================================
echo Starting File Path Collection
echo ===================================================
echo.
echo Collecting all file and folder paths from "%folder%"...
echo Please wait, this may take a few moments...

:: write the hostname, date, and time to the output file
(
    echo %hostname% %formatted_date% %formatted_time%
    echo Start Directory: %folder%
    echo.
) > "%output_file%"

:: write the full directory structure to the output file
dir /s /b "%folder%" >> "%output_file%"

:: check if the command executed successfully
if errorlevel 1 (
    echo.
    echo An error occurred while collecting paths. Please check your permissions or try again.
    exit /b 1
)

:: completion
color a
cls
echo.
echo ===================================================
echo DONE - Process Complete
echo ===================================================
echo OUTPUT: %output_file%
echo FILE SAVED IN THE PATHSCAN FOLDER - Press ANY KEY to RETURN to SELECTION

:: press any key to return
pause >nul

:: restart the script
cls
color 7
goto restart


:: file analyzer

:analyze
cls
echo PathScan File Analyzer
echo ===================================================
echo PathScan files available (TAB to autofill):
echo.
dir /b *.txt
echo ===================================================
echo.

rem create the analyzer folder if it doesn't exist
if not exist "export" (
    mkdir "export"
)

:inputLoop
rem prompt for the input file path
set /p "input_file=Select a PathScan Output File (.txt): "

rem Remove surrounding quotes from the input if they exist
set "input_file=%input_file:"=%"

rem Check if the input file exists
if not exist "%input_file%" (
    echo ERROR: File not found: "%input_file%"
    goto inputLoop
)

rem Prompt user for the keyword to search
set /p "keyword=Keyword/File Type: "
if "%keyword%"=="" (
    echo ERROR: Keyword cannot be empty.
    pause
    exit /b
)

rem Set the output file name based on the keyword
set "output_file=export\%keyword%_output_paths.txt"

rem Clear or create the output file
echo. > "%output_file%"

echo.
echo Searching for paths containing "%keyword%"...
echo.

rem Loop through each line in the input file
for /f "usebackq tokens=*" %%A in ("%input_file%") do (
    rem Display each line being processed
    set "status=Processing: %%A"

    rem Check if the line contains the keyword
    echo %%A | findstr /I /C:"%keyword%" > nul
    if not errorlevel 1 (
        rem Update the status to Found
        set "status=Found: %%A"

        rem Display the found path in real-time
        echo !status!

        rem Append the found path to the output file
        echo %%A >> "%output_file%"
    ) else (
        rem Display the processing status if not found
        echo !status!
    )
)

echo.
color 2
cls
echo PathScan File Analyzer
echo ===================================================
echo DONE - Process Complete
echo ===================================================
echo Paths containing '%keyword%' have been exported to '%output_file%' - Press ANY KEY to RETURN to SELECTION
pause > nul
cls
color 7
goto restart

endlocal
