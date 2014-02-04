Turn key dev env for OpenLayers 3
=================================

This project aims to provide a turnkey development environment for [OpenLayers 3](https://github.com/openlayers/ol3). 

It uses [Docker](http://docker.io) to provide you with a clean Ubuntu LTS (precise) with all dependencies required to build OpenLayers 3. Those dependencies include:

- OpenJDK 7 (jdk and jre)
- Python 2.7
- Git
- PhantomJS (1.9.7)
- Pip (and [required modules](https://github.com/openlayers/ol3/blob/master/requirements.txt))
- JsDoc (3.2.2)

Requirements
------------

Docker (the image was made with version 0.7.6)

It is assumed that you know what Docker is (if not go check their website, which has some nice [tutorials](http://www.docker.io/gettingstarted/)). It is also assumed that you already have a cloned fork of OpenLayers 3.
    
Setup
-----

Pull the image

    docker pull htipule/ol3

Then

    ./setup.sh <path_to_your_ol3_repo>

Here is what `setup.sh` does:

- `docker run` the htipule/ol3 image
- With an interactive bash session
- Forward container ports 8000, 9810 and 22 to the same port of your host (expect for 22 which is forwarded to 2200)
- mounts `<path_to_your_ol3_repo>` to `/workspace`


After running `setup.sh`, you should be on the container prompt as root. Since this container does not provide much tools, I suggest you use SSH to connect to it.

For that, you need to start sshd in the container:

    /usr/sbin/sshd
        
Then you can connect with:

    ssh root@127.0.0.1 -p 2200
    
Password is `root`.

The directory you provided to `setup.sh` is located in `/worksapce`. From there you can launch the OpenLayers build script (`build.py`). For instance, to launch the examples:

    cd /worksapce
    ./build.py serve &
    python -mSimpleHTTPServer &

Now, on your host machine, you can go to http://localhost:8000 and browse the `example` directory.


Build the image
---------------

You also can build the image yourself if your want.


Start by cloning this repo. 

    git clone https://github.com/ol3-docker-env
  
Then `cd` into the `ol3-docker-env` directory and build the image with the following command

    sudo docker build -t htipule/ol3 .
    
Knwon issues
------------

If your OpenLayers 3 fork resides on a NTFS partition, you won't be able to execute `build.py`. This is due to differences between NFS permissions and Unix permissions.

    
