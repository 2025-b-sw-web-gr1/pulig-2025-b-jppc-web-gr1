@echo off
REM Script para ejecutar el proyecto en Windows
REM Uso: Ejecutar este archivo directamente desde el Explorador o desde CMD

cd /d "%~dp0"

echo.
echo ======================================
echo   EXAMEN 02 - API RESTful con NestJS
echo ======================================
echo.

echo Instalando dependencias (si es la primera vez)...
if not exist "node_modules" (
    call npm install --legacy-peer-deps
    echo.
)

echo Compilando proyecto...
call npm run build

echo.
echo ======================================
echo   INICIANDO SERVIDOR
echo ======================================
echo.
echo El servidor se ejecutara en: http://localhost:3000
echo.
echo Para detener el servidor, presiona CTRL+C
echo.

call npm run start:prod

pause
