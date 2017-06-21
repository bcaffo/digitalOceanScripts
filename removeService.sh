#! /bin/bash
# a shell command for removing a service
# useage 
# wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/removeService.sh
# chmod u+x removeService.sh
# ./removeService SERVACENAME
# Brian Caffo June 2017

serviceName="plumber-"$1
path=$2
systemctl stop $serviceName
systemctl disable $serviceName
rm /etc/systemd/system/${serviceName}.service
rm /etc/nginx/sites-available/plumber-apis/${path}.conf
systemctl reload nginx
rm -rf /var/plumber/$path


