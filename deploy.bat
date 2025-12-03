@echo off
REM Git 自动推送批处理脚本

REM 设置项目目录
set PROJECT_DIR=D:\Projects\SM\HHI

REM 切换到项目目录
cd /d %PROJECT_DIR%
if %errorlevel% neq 0 (
    echo 错误：无法切换到项目目录 %PROJECT_DIR%
    pause
    exit /b 1
)

REM 显示当前目录
cls
echo 当前目录：%CD%
echo.

REM 检查Git状态
git status
if %errorlevel% neq 0 (
    echo 错误：Git命令执行失败
    pause
    exit /b 1
)

echo.
echo 按任意键继续添加所有更改...
pause >nul

REM 添加所有更改
git add .
if %errorlevel% neq 0 (
    echo 错误：git add 命令执行失败
    pause
    exit /b 1
)

echo.
echo 输入提交信息（默认为"更新内容"）：
set /p COMMIT_MSG=提交信息：
if "%COMMIT_MSG%"=="" set COMMIT_MSG=更新内容

REM 提交更改
git commit -m "%COMMIT_MSG%"
if %errorlevel% neq 0 (
    echo 错误：git commit 命令执行失败
    pause
    exit /b 1
)

echo.
echo 按任意键推送到远程仓库...
pause >nul

REM 推送到远程仓库
git push origin main
if %errorlevel% neq 0 (
    echo 错误：git push 命令执行失败
    pause
    exit /b 1
)

echo.
echo ✅ 推送成功完成！
echo 提交信息：%COMMIT_MSG%
echo.
pause