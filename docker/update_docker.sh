#!/bin/bash
sudo docker commit aigc5 intflow/aigc5:svamp
sudo docker login docker.io -u kmjeon -p 1011910119a!
sudo docker tag aigc5:svamp intflow/aigc5:svamp
sudo docker push intflow/aigc5:svamp
