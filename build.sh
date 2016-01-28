#!/usr/bin/env bash

docker build --rm -t flyhard/consul .
#confdtest
docker run --rm -it -P --name consul flyhard/consul:latest -bootstrap -atlas flyhard/atlas -atlas-token ${TOKEN} -atlas-join
