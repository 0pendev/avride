#!/bin/sh
podman pod create --name avride

podman run \
       --pod avride \
       --name devbackend \
       --rm \
       --device /dev/ttyUSB0 \
       --volume .:/home/avride \
       -d \
       -it avride/devbackend

podman run \
       --pod avride \
       --name rizin \
       --rm \
       --volume .:/mnt/avride \
       -d \
       -it avride/rizin

podman run \
       --pod avride \
       --name simavr \
       --rm \
       --volume .:/home/avride \
       -d \
       -it avride/simavr
       
	      
	      
   
