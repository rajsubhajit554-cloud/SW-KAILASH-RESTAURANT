@echo off
title Git Auto Update - Kailash Restaurant
color 0A
cls

echo =======================================================
echo          SW KAILASH RESTAURANT - GIT AUTO UPDATER
echo =======================================================
echo.

:: Check git status
echo [1/4] Checking Repository Status...
git status -s
echo.

:: Stage all modified and new files
echo [2/4] Staging all files...
git add .
echo [OK] Files staged successfully.
echo.

:: Ask for custom commit message or default to timestamp
set /p commit_msg="Enter commit message (Press ENTER for default auto-update): "
if "%commit_msg%"=="" (
    for /f "tokens=1-4 delims=/ " %%a in ("%date%") do set mydate=%%c-%%a-%%b
    for /f "tokens=1-2 delims=: " %%a in ("%time%") do set mytime=%%a:%%b
    set commit_msg=Update website content [%DATE% %TIME%]
)

echo.
echo [3/4] Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"
echo.

:: Push to remote
echo [4/4] Pushing changes to GitHub (origin main)...
git push origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =======================================================
    echo    SUCCESS! GitHub Repository Updated Successfully!
    echo =======================================================
) else (
    echo.
    echo =======================================================
    echo    FAILED! Please check your internet or git credentials.
    echo =======================================================
)

echo.
pause
