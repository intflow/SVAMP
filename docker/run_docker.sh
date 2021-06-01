#!/bin/bash X11 sudo bash attach_NAS_ftp.sh
sudo xhost +local:root
#Mount Data folders
sudo mkdir /DL_data_big
sudo mount 192.168.0.18:/DL_data_big /DL_data_big
#sudo mount 192.168.0.14:/NAS1 /NAS1 Pull update docker image
sudo docker pull intflow/aigc5:svamp

#Run Dockers for CenterNet+DeepSORT
sudo docker run --name aigc5 \
--gpus all --rm -p 6434:6434 \
--mount type=bind,src=/home/intflow/works,dst=/works \
--mount type=bind,src=/DL_data_big,dst=/DL_data_big \
--net=host \
--privileged \
--ipc=host \
-it intflow/aigc5:svamp /bin/bash

#-it intflow/gc2020_intflow_track4:default /bin/bash -it nvcr.io/nvidia/pytorch:20.03-py3 /bin/bash -it
#nvcr.io/nvidia/tensorrt:20.07-py3 /bin/bash
