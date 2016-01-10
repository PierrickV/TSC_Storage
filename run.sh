#!/usr/bin/env bash
cd $(pwd)/DOCKER/WEB/ && ./build.sh
../start_hub.sh
../start_web.sh