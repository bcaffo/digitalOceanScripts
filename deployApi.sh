## Starts up a plumber api
## Brian Caffo June 2017

path=$1
localPath=$2
mkdir -p /var/plumber/${path}
cp localPath/* /var/plumber/${path}/.
serviceName="plumber-"$path
service=/usr/local/lib/R/site-library/plumber/server/plumber.service
cp service /etc/systemd/system/${serviceName}.service
systemctl daemon-reload
systemctl start $serviceName && sleep 1
systemctl restart $serviceName && sleep 1
systemctl enable $serviceName

##check it if you want
# systemctl status

conf=/usr/local/lib/R/site-library/plumber/server/plumber-api.conf

cp $conf /etc/nginx/sites-available/plumber-apis/${path}.conf
systemctl reload nginx

