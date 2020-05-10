##Set to true if you want to set up swap RAM
SWAP=$false
##Set to true if you want to set your prompt to be 
SETPROMPT=$false

# get R
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

## I like my prompt to be really small
if [ SETPROMPT ]; then
  echo "PS1='$ '" >> .bashrc
fi

## note added r-dev
sudo apt-get update
sudo apt-get -y install r-base r-base-dev

## add swap space to install stuff
if [ SWAP ] ; then
  sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
  sudo /sbin/mkswap /var/swap.1
  sudo /sbin/swapon /var/swap.1
  sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'
fi 

## Ubuntu installs
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libapparmor1 gdebi-core
#install emacs
sudo apt-get -y install emacs
sudo apt-get -y install python-pip python-virtualenv
# Install latex 
sudo apt-get -y install texlive-full  

## Install shiny, devtools, rmarkdown, tidyverse
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('tidyverse', repos='http://cran.rstudio.com/')\""

# actually install rstudio server
wget $RSTUDIO
wget $SHINY
sudo gdebi --non-interactive rstudio*.deb
sudo gdebi --non-interactive shiny*.deb


# I got this from here: https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server
# this allows the port to be 80 so that you don't have to type 8787 
sudo /bin/sh -c 'echo "www-port=80" >> /etc/rstudio/rserver.conf'

sudo rstudio-server start

# install keras
sudo su - -c "R -e \"devtools::install_github('rstudio/keras')\""

# Upgrade pip
sudo -H pip install --upgrade pip
# Upgrade python AI libraries
sudo pip install --upgrade keras
sudo -H pip install --upgrade tensorflow
sudo -H pip install --upgrade theano
sudo -H pip install --upgrade Pillow
#sudo -H pip install --upgrade pillow


# Install keras
sudo su - -c "R -e \"library(keras); install_keras()\""


