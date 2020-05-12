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
sudo su - -c "R -e \"install.packages('rmarkdown', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('tidyverse', repos='http://cran.rstudio.com/')\""
