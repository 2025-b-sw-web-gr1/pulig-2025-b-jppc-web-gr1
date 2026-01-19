#!/bin/bash
# Script para ejecutar el proyecto en Linux/Mac
# Uso: bash run.sh

cd "$(dirname "$0")"

echo ""
echo "======================================"
echo "  EXAMEN 02 - API RESTful con NestJS"
echo "======================================"
echo ""

echo "Instalando dependencias (si es la primera vez)..."
if [ ! -d "node_modules" ]; then
    npm install --legacy-peer-deps
    echo ""
fi

echo "Compilando proyecto..."
npm run build

echo ""
echo "======================================"
echo "  INICIANDO SERVIDOR"
echo "======================================"
echo ""
echo "El servidor se ejecutará en: http://localhost:3000"
echo ""
echo "Para detener el servidor, presiona CTRL+C"
echo ""

npm run start:prod
