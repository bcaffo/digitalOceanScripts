Documtation for the supoorted builds here [https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)

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
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
```

Then in R 
```
install.packages(keras)
library(keras)
install_keras()
```

That works for me.




