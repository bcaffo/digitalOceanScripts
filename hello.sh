
## get's the hello example up and running 
cp /usr/local/lib/R/site-library/plumber/examples/10-welcome/* /var/plumber/hello/
wget https://raw.githubusercontent.com/bcaffo/alexaai/master/lectures/03_using_plumber/servicefile
mv servicefile /etc/systemd/system/plumber-hello.service
systemctl daemon-reload
systemctl start plumber-hello && sleep 1
systemctl restart plumber-hello && sleep 1
systemctl enable plumber-hello

## check the status of the plumber script
systemctl status plumber-hello

wget https://raw.githubusercontent.com/bcaffo/alexaai/master/lectures/03_using_plumber/conf
mv conf /etc/nginx/sites-available/plumber-apis/hello.conf
systemctl reload nginx
