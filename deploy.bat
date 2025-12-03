@echo off
REM Git auto push script

REM Set project directory
set PROJECT_DIR=D:\Projects\SM\HHI

REM Change to project directory
cd /d %PROJECT_DIR%
if %errorlevel% neq 0 (
    echo Error: Cannot change to project directory %PROJECT_DIR%
    pause
    exit /b 1
)

REM Show current directory
cls
echo Current directory: %CD%
echo.

REM Check Git status
git status
if %errorlevel% neq 0 (
    echo Error: Git command failed
    pause
    exit /b 1
)

echo.
echo Press any key to continue adding all changes...
pause >nul

REM Add all changes
git add .
if %errorlevel% neq 0 (
    echo Error: git add command failed
    pause
    exit /b 1
)

echo.
echo Press any key to commit changes...
pause >nul

REM Commit changes
git commit -m "Update content"
if %errorlevel% neq 0 (
    echo Error: git commit command failed
    pause
    exit /b 1
)

echo.
echo Press any key to push to remote repository...
pause >nul

REM Push to remote repository
git push origin main
if %errorlevel% neq 0 (
    echo Error: git push command failed
    pause
    exit /b 1
)

echo.
echo Push completed successfully!
echo.
pause