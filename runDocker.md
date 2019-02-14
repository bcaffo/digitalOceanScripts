Documtation for the supoorted builds here [https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)


## Installing keras

Create a DO instance with docker installed. (It's one of their packages that can be auto installed.) Download a rocker image:

```
docker pull rocker/tidyverse
```


Then run the instance

```
docker run rocker/tidyverse
```

Log into the instance

```
docker container list
docker exec -it <container id> /bin/bash
```

In the instance, to get keras running need some other stuff

```
sudo apt-get update
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade virtualenv 
```

I need the jpeg lib
```
sudo apt-get install libjpeg-dev
```


Then in R 
```
install.packages(jpeg)
install.packages(keras)
library(keras)
install_keras()
## need the github version of reticulate
devtools::install_github("rstudio/reticulate")
```

That works for me.


## Installing rstudio

Useful page [http://www.exegetic.biz/blog/2017/07/rstudio-docker-digitalocean/](http://www.exegetic.biz/blog/2017/07/rstudio-docker-digitalocean/)

```
docker pull rocker/rstudio
docker run -d -p 80:8787 -e USER=<username> -e PASSWORD=<password> rocker/rstudio
```
you don't have to go to port 8787 when you do this (since it's sending port 80 traffic through to port 8787)

Also, here's some notes on persistent user data [https://datawookie.netlify.com/blog/2017/07/docker-persisting-user-data/](https://datawookie.netlify.com/blog/2017/07/docker-persisting-user-data/)

