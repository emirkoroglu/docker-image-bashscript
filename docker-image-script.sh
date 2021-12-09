#!/bin/bash

echo Please tell me the image.

read IMAGE
echo Please wait
docker run -d --name task -P  $IMAGE  2> /dev/null

docker ps 

echo Please tell me the running container id.

read CONTAINERID

docker exec -it "$CONTAINERID"  bash   2> /dev/null

sleep 10

echo Would you like to delete all images and containers? only yes will be accepted
read yes
if  [ $yes = "yes" ]
then
  docker rm -f `docker ps -qa` 
  docker rmi -f $(docker images -aq)
else
  echo "Destroy cancelled"
fi

#emirsway copyright 2021
