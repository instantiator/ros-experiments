#!/bin/bash

docker run -it --rm --name ROS --volume "`pwd`/scripts:/scripts" ros:latest

