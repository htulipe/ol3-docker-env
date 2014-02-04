sudo docker run -i -p 127.0.0.1:8000:8000 -p 127.0.0.1:9810:9810 -p 127.0.0.1:2200:22 -v $1:/workspace:rw -t htipule/ol3 /bin/bash

