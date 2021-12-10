#!/bin/bash

echo Please Enter the Docker Image

read IMAGE
echo Please Wait!
docker run -d --name task -P  $IMAGE  2> /dev/null

docker ps 

echo Please enter the running Container ID

read CONTAINERID

docker exec -it "$CONTAINERID"  bash   2> /dev/null

sleep 1

echo Warning! Would you like to delete all images and containers? only y will be accepted
read y
if  [ $y = "y" ]
then
  docker rm -f `docker ps -qa` 
  docker rmi -f $(docker images -aq)
else
  echo "Destroy Cancelled"
fi

#emirsway copyright 2021
