#!/bin/bash

docker run -dt --network example-net --ip 172.28.0.11 \
--name example01 \
--hostname example01.com \
--add-host=example01.com:172.28.0.11 \
--add-host=example02.com:172.28.0.12 \
centos-sshd

docker run -dt --network example-net --ip 172.28.0.12 \
--name example02 \
--hostname example02.com \
--add-host=example01.com:172.28.0.11 \
--add-host=example02.com:172.28.0.12 \
centos-sshd
