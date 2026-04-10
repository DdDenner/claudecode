@echo off
REM Script para limpar disco com privilégios de administrador
REM Clique duas vezes para executar

setlocal enabledelayedexpansion

REM Verificar se está rodando como admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo   OBTENDO PERMISSOES DE ADMINISTRADOR
    echo ========================================
    echo.

    REM Executar como admin
    powershell -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0limpar-disco.ps1\"' -Verb RunAs"
    exit /b
)

REM Se chegou aqui, está rodando como admin
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "limpar-disco.ps1"

echo.
echo Pressione qualquer tecla para sair...
pause >nul
