#!/bin/bash

echo Please tell me the image.

read IMAGE

docker run -d --name task -P  $IMAGE  2> /dev/null

docker ps 

echo Please tell me the running container id.

read CONTAINERID

docker exec -it "$CONTAINERID"  bash   2> /dev/null

#emirsway copyright 2021
