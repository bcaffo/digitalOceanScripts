#! /bin/bash
# create the droplet or ec2 instance
# make sure to add your ssh key
# boot up the instance, ssh in as root
# this script sets up plumber and nginx

# create swap if you have a low memory instance
fallocate -l 4G /swapfile 
chmod 600 /swapfile 
mkswap /swapfile
sudo swapon /swapfile

#fetch all of the R stuff that you need and related libraries
echo 'deb https://cran.rstudio.com/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt-get update
sudo apt-get install -y r-base r-base-dev
echo "options(repos=c('http://cran.rstudio.com/'))" > .Rprofile
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libgit2-dev
sudo apt-get install -y libssl-dev

# install devtools and development version of plumber
Rscript -e "install.packages('devtools', repos='https://cran.rstudio.com/')"
Rscript -e "devtools::install_github('trestletech/plumber')"


#this is where the plumber scripts go
mkdir -p /var/plumber

#install nginx, the web server that plumber works with
sudo apt-get install -y nginx 
rm -f /etc/nginx/sites-enabled/default

mkdir -p /var/certbot
mkdir -p /etc/nginx/sites-available/plumber-apis/

#this is the default nginx config for plumber
cp /usr/local/lib/R/site-library/plumber/server/nginx.conf /etc/nginx/sites-available/plumber
ln -sf /etc/nginx/sites-available/plumber /etc/nginx/sites-enabled/

# restart nginx
systemctl reload nginx

## set up the firewall
ufw allow http
ufw allow ssh 
ufw -f enable
