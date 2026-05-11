#!/bin/bash

docker run --name kali --rm -it -v ./save:/save -p5901:5901 --cap-add=NET_ADMIN kali

