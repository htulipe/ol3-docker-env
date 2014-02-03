Turn key dev env for OpenLayers 3
=================================

This project aims to provide a turnkey development environment for [OpenLayers 3](https://github.com/openlayers/ol3). 

It uses [Docker](http://docker.io) to provide you with a clean Ubuntu LTS (precise) with all dependencies required to build OpenLayers 3.

Requirements:
-------------

Docker (made with version 0.7.6)

It is assumed that you know what Docker is (if not go check their website, which has some nice [tutorials](http://www.docker.io/gettingstarted/)). It is also assumed that you already have a cloned fork of OpenLayers 3.
    
Setup
-----

    ./sample.sh <path_to_your_ol3_repo>

Here is what `sample.sh` does:

- `docker run` the htulipe/ol3 image (see bellow for building this image)
- With an interactive bash session
- Forward container ports 8000, 9810 and 22 to the same port of your host (expect for 22 which is forwarded to 2200)
- mount `<path_to_your_ol3_repo>` to `/workspace`


Build the image
---------------

Start by cloning this repo. 

    git clone https://github.com/ol3-docker-env
  
Then `cd` into the `ol3-docker-env` directory and build the image with the following command

    sudo docker build -t htipule/ol3 .
    
