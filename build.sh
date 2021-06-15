#!/usr/bin/env sh

(cd 7.3;docker build --no-cache -t ecomgems/opencart-app:7.3 .)
docker push ecomgems/opencart-app:7.3
