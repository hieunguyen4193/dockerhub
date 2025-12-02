#!/bin/bash
port=$1;
name=$2;
docker_name=$3;

sudo docker run -it \
    -v /home/hieunguyen:/home/hieunguyen \
    -v /media:/media -p ${port}:8888 \
    -e PASSWORD=genov4 --name ${name} \
    ${docker_name}:latest bash


# sudo docker run -it \
#     -v /home/hieunguyen:/home/hieunguyen \
#     -v /media:/media -p 9191:8888 \
#     -e PASSWORD=genov4 --name interactive \
#     tronghieunguyen/rnavelocity:latest bash