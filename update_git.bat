@echo off
:: Enable local variables
setlocal enabledelayedexpansion

title Sathi Restaurant Website - Git Update Helper

echo ===================================================
echo   Sathi Restaurant Website - Git Update Helper
echo ===================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your PATH.
    echo Please install Git and try again.
    pause
    exit /b
)

:: Show current status
echo Current Git status:
echo ---------------------------------------------------
git status -s
echo ---------------------------------------------------
echo.

:: Ask user if they want to push updates
set /p "proceed=Do you want to add, commit, and push these changes? (Y/N): "
if /i "%proceed%" neq "Y" (
    echo.
    echo Operation cancelled by user.
    pause
    exit /b
)

echo.
:: Ask for a commit message
set /p "commit_msg=Enter commit message (Press Enter for default: 'Update website'): "

:: If empty, set default
if "%commit_msg%"=="" (
    set "commit_msg=Update website"
)

echo.
echo Adding changes...
git add -A

echo.
echo Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"

echo.
echo Pushing changes to GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo      SUCCESS: Changes pushed to GitHub successfully!
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo      ERROR: Failed to push changes to GitHub.
    echo ===================================================
)

echo.
pause
