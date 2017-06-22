# This is just a script version of http://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/
# You should step through this script, don't run it as a script like the other ones.


# also set up your ssh keys for this new user
# cat MYPUBLICKEY >> ~/.ssh/authorized_keys

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

sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"devtools::install_github('daattali/shinyjs')\""


sudo apt-get -y install libapparmor1 gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.896-amd64.deb
sudo gdebi rstudio-server-0.99.896-amd64.deb


# I got this from here: https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server
# this allows the port to be 80 so that you don't have to type 8787 
sudo /bin/sh -c 'echo "www-port=80" >> /etc/rstudio/rserver.conf'

sudo rstudio-server restart


