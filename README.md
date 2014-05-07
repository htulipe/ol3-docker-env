Turn key dev env for OpenLayers 3
=================================

This project aims to provide a turnkey development environment for [OpenLayers 3](https://github.com/openlayers/ol3). 

It uses [Docker](http://docker.io) to provide you with a clean Ubuntu LTS (precise) with all dependencies required to build OpenLayers 3. Those dependencies include:

- OpenJDK 7 (jdk and jre)
- Python 2.7
- Git
- PhantomJS (1.9.7)
- Node.js and the Node Package Manager
- Pip (and [required modules](https://github.com/openlayers/ol3/blob/master/requirements.txt))
- JsDoc (3.2.2)

Requirements
------------

Docker (the image was made with version 0.7.6)

It is assumed that you know what Docker is (if not go check their website, which has some nice [tutorials](http://www.docker.io/gettingstarted/)). It is also assumed that you already have a cloned fork of OpenLayers 3.
    
Quickstart
----------

Download the `run.sh` script (by cloning this repo for instance).

Pull the image (this is a bit long but you only have to do it once)

    sudo docker pull htipule/ol3

Then, every time you want to code:

    ./run.sh <path_to_your_ol3_repo>
    
Go to `http://localhost:8000/examples` to see the list of Openlayers 3 examples running.

Go ahead and code whatever you like. To build Openlayers 3 you need to connect through ssh

    ssh root@localhost -p 2200 

Password is `root`. Your directory is mounted under `/workspace`.

Using the image
---------------

To upgrade to the latest image, execute the floowing in your host machine:

    sudo docker pull htipule/ol3

If you ever need to restart plovr, you can use `supervisorctl` inside the conatiner:

    supervisorctl restart plovr

More details
------------

Here is what `run.sh` does:

- `sudo docker run` the htipule/ol3 image
- Forward container ports 8000, 9810 and 22 to the same port of your host (expect for 22 which is forwarded to 2200)
- Mounts `<path_to_your_ol3_repo>` to `/workspace`
- Launch supervisord which starts:
    - an ssh server
    - `./build.py serve`
    - `python -m SimpleHTTPServer`


Build the image
---------------

You also can build the image yourself if your want.

Start by cloning this repo. 

    git clone https://github.com/ol3-docker-env
  
Then `cd` into the `ol3-docker-env` directory and build the image with the following command

    sudo docker build -t htipule/ol3 .
    
Known issues
------------

If your OpenLayers 3 fork resides on a NTFS partition, you won't be able to execute `build.py`. This is due to differences between NFS permissions and Unix permissions.

Changelog
---------

It's in the Wiki.
