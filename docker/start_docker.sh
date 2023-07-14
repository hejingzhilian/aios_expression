#!/bin/bash

docker_name=expression_dev_ss

docker stop $docker_name
docker rm $docker_name

docker run -dt --name $docker_name -v /home/shishuai/code/aios_expression/:/workspace -v /home/toc/SDE/shuai.shi/docker_workspace/havenask:/havenask  expression_dev:v1 /bin/bash

