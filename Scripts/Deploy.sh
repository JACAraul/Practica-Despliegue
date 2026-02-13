#!/bin/bash

REPO="/home/ubuntu/Practica-Despliegue"
LIB="/usr/share/tomcat10/lib/servlet-api.jar"
WEBAPPS="/var/lib/tomcat10/webapps"

echo "Situandose en la carpteta del proyecto..."
cd $REPO

echo "Actualizando el contenido del repositorio"
git pull

echo "Preparando Compilacion"
rm -rf build
echo "creando el archivo de alojamiento del proyecto"
mkdir -p build/WEB-INF/classes

echo "Buscando archivo java"
ARCHIVO_JAVA=$(find . -name "HolaServlet.java")

echo "Compilando"
javac -cp $LIB -d build/WEB-INF/classes "$ARCHIVO_JAVA"

echo "Empaquetando y deplegando"
cd build
jar -cvf ../hola.war *
cd ..
sudo cp hola.war $WEBAPPS/
sudo systemctl restart tomcat10
rm -rf build

curl -I http://localhost:8080/hola/HolaServlet
