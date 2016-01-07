#!/bin/bash

mkdir -p /opt/build
mkdir -p /opt/usr/arm-linux

if [ -n "${SSH_USER}" ]; then

    chown -R ${SSH_USER}:${SSH_USER} /opt/usr/arm-linux
fi
