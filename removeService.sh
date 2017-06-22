#! /bin/bash
# a shell command for removing a service
# useage 
# wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/removeService.sh
# chmod u+x removeService.sh
# ./removeService SERVACENAME
# Brian Caffo June 2017

serviceName = "plumber-"$1
echo $serviceName
