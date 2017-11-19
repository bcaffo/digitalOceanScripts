# This is just a script version of http://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/
export RSTUDIO='https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-1.1.383-amd64.deb'
export SHINY='https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb'

# get R
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

## note added r-dev
sudo apt-get update
sudo apt-get -y install r-base r-base-dev

## add swap space to install stuff
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'

sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libapparmor1 gdebi-core

## Install shiny and devtools
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""

# actually install rstudio server
wget $RSTUDIO
wget $SHINY
sudo gdebi --non-interactive rstudio*.deb
sudo gdebi --non-interactive shiny*.deb


# I got this from here: https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server
# this allows the port to be 80 so that you don't have to type 8787 
sudo /bin/sh -c 'echo "www-port=80" >> /etc/rstudio/rserver.conf'

sudo rstudio-server restart

# install keras
sudo su - -c "R -e \"devtools::install_github('rstudio/keras')\""
sudo apt-get -y install python-pip python-virtualenv
sudo su - -c "R -e \"library(keras); install_keras()\""

# Install R Markdown
sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""
