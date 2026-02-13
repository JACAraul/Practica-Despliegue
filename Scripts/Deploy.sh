#!/bin/bash

REPO="/home/ubuntu/Practica-Despliegue"
LIB="/usr/share/tomcat10/lib/servlet-api.jar"
WEBAPPS="/var/lib/tomcat10/webapps"

cd $REPO

git pull

rm -rf build
mkdir -p build/WEB-INF/classes

ARCHIVO_JAVA=$(find . -name "HolaServlet.java")

javac -cp $LIB -d build/WEB-INF/classes "$ARCHIVO_JAVA"

cd build
jar -cvf ../hola.war *
cd ..
sudo cp hola.war $WEBAPPS/
sudo systemctl restart tomcat10

curl -I http://localhost:8080/hola/HolaServlet
# dadsdadsa ads