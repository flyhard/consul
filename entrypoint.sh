#!/usr/bin/env bash

/consul/consul agent -server -bootstrap-expect=1 -config-file consul-config.json -ui-dir=/consul/dist -client=0.0.0.0 @*
