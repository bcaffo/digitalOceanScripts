# digitalOceanScripts

This is a collection of digital ocean scripts for ubuntu (16.04) droplets. Most of them should work for any ubuntu server.

**DON'T RUN YOUR PLUMBER SERVER AND RSTUDIO SERVER ON THE SAME SERVER!**

## To set up a server running nginx and plumber

```
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/setUpPlumber.sh
bash setUpPlumber.sh
```

Go to your ip to make sure that nginx is set up correctly

## To set up the hello example 

```
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/hello.sh
bash hello.sh
```

If you go to `[IP ADDRESS]/hello` it should say "Plumber is alive!"

## To remove an API
```
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/removeService.sh
chmod u+x removeService.sh
./removeService PATH
```
For example `./removeService hello` will remove the `hello` example

## To set up an rstudio server 
Probably you want to set up a new user and then 
```
adduser NEWUSERNAME
gpasswd -a NEWUSERNAME sudo
su - NEWUSERNAME
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/setUpRstudio.sh
bash setUpRstudio.sh
```



