#!/bin/bash

sudo apt-get update && sudo apt-get upgrade
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# todo: promt the user for input
sudo usermod -aG docker pi
# todo: prompt the user to restart system

