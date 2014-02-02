FROM ubuntu:latest

# Twick to install packge that depends on Fuse https://gist.github.com/henrik-muehe/6155333
RUN apt-get -y --force-yes  install libfuse2
RUN cd /tmp ; apt-get download fuse
RUN cd /tmp ; dpkg-deb -x fuse_* .
RUN cd /tmp ; dpkg-deb -e fuse_*
RUN cd /tmp ; rm fuse_*.deb
RUN cd /tmp ; echo -en '#!/bin/bash\nexit 0\n' > DEBIAN/postinst
RUN cd /tmp ; dpkg-deb -b . /fuse.deb
RUN cd /tmp ; dpkg -i /fuse.deb

RUN apt-get update

# Install Java 7
RUN apt-get -y --force-yes install openjdk-7-jdk

# Install python
RUN apt-get -y --force-yes install python2.7 python2.7-dev

# Install git
RUN apt-get -y --force-yes install git

# Install useful tools 
RUN apt-get -y --force-yes install wget gcc screen

# Install phantom js 
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN mv phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm -f phantomjs-1.9.7-linux-x86_64.tar.bz2 && rm -rf phantomjs-1.9.7-linux-x86_64/bin/phantomjs

# Install pip and python modules
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
RUN pip install regex
RUN pip install pystache
RUN pip install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

#Install JSDoc
RUN git clone https://github.com/jsdoc3/jsdoc
RUN cd jsdoc && git checkout v3.2.2 
RUN ln -s /jsdoc/jsdoc /usr/bin/jsdoc	
