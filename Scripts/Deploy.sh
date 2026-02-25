#!/bin/bash

REPO="/home/ubuntu/Practica-Despliegue"
LIB="/usr/share/tomcat10/lib/servlet-api.jar"
WEBAPPS="/var/lib/tomcat10/webapps"

echo ">>> [1] Situándose en la carpeta del proyecto..."
cd $REPO
git pull 

echo ">>> [2] Preparando compilación..."
rm -rf build
mkdir -p build/WEB-INF/classes

echo ">>> [3] Buscando archivo Java..."
ARCHIVO_JAVA=$(find . -name "HolaServlet.java")
echo "☑ Archivo a compilar: $ARCHIVO_JAVA"

echo ">>> [4] Compilando..."
javac -cp $LIB -d build/WEB-INF/classes "$ARCHIVO_JAVA"

echo ">>> [5] Empaquetando y Desplegando..."
cd build
jar -cvf ../hola.war *
cd ..
sudo cp hola.war $WEBAPPS/
sudo systemctl restart tomcat10
rm -rf build

echo ">>> [6] Verificando..."
curl -I http://localhost:8080/hola/HolaServlet