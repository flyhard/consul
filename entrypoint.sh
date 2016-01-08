#!/usr/bin/env bash

/consul/consul agent -server -config-file consul-config.json -ui-dir=/consul/dist -client=0.0.0.0 $@
