#!/bin/bash

REPO="/home/ubuntu/Practica-Despliegue"
WEBAPPS="/var/lib/tomcat10/webapps"
LIB="/usr/share/tomcat10/lib/servlet-api.jar"

cd $REPO
git pull origin main

rm -rf build
mkdir -p build/WEB-INF/classes

javac -cp $LIB -d build/WEB-INF/classes src/hola/HolaServlet.java

cd build
jar -cvf ../hola.war *
cd ..

sudo cp hola.war $WEBAPPS/
sudo systemctl restart tomcat10

sleep 10
curl -I http://localhost:8080/hola/
