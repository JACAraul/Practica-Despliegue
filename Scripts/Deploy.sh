#!/bin/bash

# ==========================================
# SCRIPT DE DESPLIEGUE - MODO LOCAL
# (Sin descarga de GitHub para evitar reseteos)
# ==========================================

REPO="/home/ubuntu/Practica-Despliegue"
LIB="/usr/share/tomcat10/lib/servlet-api.jar"
WEBAPPS="/var/lib/tomcat10/webapps"

echo ">>> [1] Situándose en la carpeta del proyecto..."
cd $REPO

# NOTA: He quitado el git pull/reset para que no borre tus cambios locales

echo ">>> [2] Preparando compilación..."
rm -rf build
mkdir -p build/WEB-INF/classes

echo ">>> [3] Buscando archivo Java..."
# Busca el archivo automáticamente, se llame src o Hola
ARCHIVO_JAVA=$(find . -name "HolaServlet.java")

if [ -z "$ARCHIVO_JAVA" ]; then
    echo "❌ ERROR: No encuentro HolaServlet.java"
    exit 1
fi
echo "✅ Archivo a compilar: $ARCHIVO_JAVA"

echo ">>> [4] Compilando..."
javac -cp $LIB -d build/WEB-INF/classes "$ARCHIVO_JAVA"

if [ $? -ne 0 ]; then
    echo "❌ Fallo al compilar. Revisa el código Java."
    exit 1
fi

echo ">>> [5] Empaquetando y Desplegando..."
cd build
jar -cvf ../hola.war *
cd ..
sudo cp hola.war $WEBAPPS/
sudo systemctl restart tomcat10

echo ">>> [6] Verificando..."
sleep 5
curl -I http://localhost:8080/hola/HolaServlet
