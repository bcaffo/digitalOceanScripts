# digitalOceanScripts

This is a collection of digital ocean scripts 

- `setUpPlumber.sh` will set up plumber on an ubuntu 16 digital ocean server
- `hello.sh` will set up the hello example
- `setUpRstudio.sh` will set up rstudio on a digital ocean server (or anything else for that matter)

The other files are just utility files

**DON'T RUN YOUR PLUMBER SERVER AND RSTUDIO SERVER ON THE SAME SERVER!**

## To set up a server running nginx and plumber

```
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/setUpPlumber.sh
bash setUpPlumber.sh
```

Co to your ip to make sure that nginx is set up correctly

## To set up the hello example 

```
wget https://raw.githubusercontent.com/bcaffo/digitalOceanScripts/master/hello.sh
bash hello.sh
```

## To set up an rstudio server 
This isn't really set up as a script now. Just step through the lines of
`setUpRstudio.sh`



