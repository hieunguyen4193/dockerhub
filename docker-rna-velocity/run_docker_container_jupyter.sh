#!/bin/bash
port=$1;
name=$2;
docker_name=$3;

sudo docker run -it \
    -v /Users/hieunguyen:/home/hieunguyen \
    -v /Volumes:/media -p ${port}:8888 \
    -e PASSWORD=genov4 --name ${name} \
    ${docker_name}:latest bash

# bash '/Users/hieunguyen/src/docker/docker-single-cell-pipeline/run_docker_container.sh' 8181 rstudio1 tronghieunguyen/single_cell_pipeline %   
# jupyter lab --ip 0.0.0.0 --port 8888 --allow-root