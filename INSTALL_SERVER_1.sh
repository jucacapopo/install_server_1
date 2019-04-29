#!/bin/bash

#INSTALACIÓN DNS
#Instalar en ambos servidores

#Actualizamos repositorios de paquetes 
sudo apt update -y

#Instalamos bind9 y utilidades 
sudo apt install -y bind9 bind9utils bind9-doc dnsutils
 
#Nos movemos a la carpeta de archivos de configuración de bind
cd /etc/bind/

#Cambiamos nombre archivos
sudo mv named.conf named.conf.bck
sudo mv named.conf.local named.conf.local.bck

#DESCARGAMOS ARCHIVOS DE CONFIGURACIÓN
sudo wget https://github.com/jucacapopo/bind9/archive/master.zip

#DESCARGAMOS ZIP
sudo apt-get install zip unzip -y

#DESCOMPRIMIMOS ARCHIVO ZIP
sudo unzip -j master.zip

#CREAR CARPETA DE ARCHIVOS LOG
sudo mkdir /var/log/named/

#CAMBIAMOS PROPIETARIO ARCHIVOS LOG
sudo chown bind -R /var/log/named/

#Reiniciar servidor DNS
sudo systemctl restart bind9

#Incluimos en inicio de sistema
sudo systemctl enable bind9

#COMPROBAR INSTALACIÓN
nslookup movistarplus.es

#Eliminamos master.zip
sudo rm master.zip

#FIN INSTALACIÓN BIND9 (SERVIDOR DNS)

sleep 10s

#INSTALAMOS NGINX
sudo apt install nginx -y

#Nos movemos a la carpeta de archivos de configuración de bind
cd /etc/nginx/sites-available/

#Cambiamos nombre archivo default
sudo mv default default.bck

#DESCARGAMOS ARCHIVO DE CONFIGURACIÓN
sudo wget https://github.com/jucacapopo/nginx/archive/master.zip

#DESCOMPRIMIMOS ARCHIVO ZIP
sudo unzip -j master.zip

#INICIAMOS NUESTRO SERVIDOR WEB NGINX
sudo systemctl restart nginx

#INCLUIMOS EN ARRANQUE DEL SISTEMA
sudo systemctl enable nginx

#Eliminamos master.zip
sudo rm master.zip

#FIN INSTALACIÓN NGINX

sleep 10s

#Actualizamos repositorios de paquetes 
sudo apt-get update -y

#INSTALAMOS KEEPALIVED
sudo apt-get install -y keepalived

#Nos movemos a la carpeta de archivos de configuración de bind
cd /etc/keepalived/

#DESCARGAMOS ARCHIVO DE CONFIGURACIÓN
sudo wget https://github.com/jucacapopo/keepalived_server_1/archive/master.zip

#DESCOMPRIMIMOS ARCHIVO ZIP
sudo unzip -j master.zip

#REINICIAMOS KEEPALIVED
sudo systemctl restart keepalived.service

#INCLUIMOS KEEPALIVED EN EL ARRANQUE DEL SISTEMA
sudo systemctl enable keepalived.service

#Eliminamos master.zip
sudo rm master.zip

#FIN INSTALACIÓN KEEPALIVED

sleep 10s

#INSTLAMOS VARNISH
sudo apt install varnish -y

#Nos movemos a la carpeta de archivos de configuración de bind
cd /etc/varnish/

#Cambiamos nombre archivo
sudo mv default.vcl default.vcl.bck

#DESCARGAMOS ARCHIVOS DE CONFIGURACIÓN
sudo wget https://github.com/jucacapopo/varnish/archive/master.zip

#DESCOMPRIMIMOS ARCHIVO ZIP
sudo unzip -j master.zip

#CAMBIAMOS NOMBRE DE ARCHIVO /etc/default/varnish
sudo mv /etc/default/varnish /etc/default/varnish.bck

#Movemos archivo /etc/default/varnish
sudo mv varnish /etc/default/

#CAMBIAMOS NOMBRE DE ARCHIVO /lib/systemd/system/varnish.service
sudo mv /lib/systemd/system/varnish.service /lib/systemd/system/varnish.service.bck

#Movemos archivo /lib/systemd/system/varnish.service
sudo mv varnish.service /lib/systemd/system/

#REINICIAMOS VARNISH
sudo systemctl restart varnish

#HABILITAMOS VARNISH EN INICIO DE SISTEMA
sudo systemctl enable varnish

#FIN INSTALACIÓN VARNISH

exit