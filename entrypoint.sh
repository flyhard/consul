#!/usr/bin/env bash

/usr/bin/consul agent -server -config-dir=/etc/consul -client=0.0.0.0 $@
