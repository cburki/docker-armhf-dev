#!/bin/bash

STATUS_FILE=/opt/rpi-toolchain.status
TOOLCHAIN_PATH=/opt/rpi-toolchain
LIB_PATH=/opt/usr/

if [ -f ${STATUS_FILE} ]; then

    echo "Toolchain already installed, exiting"
    exit 0
fi

echo "Installing the toolchain"
mkdir -p ${TOOLCHAIN_PATH}
mkdir -p ${LIB_PATH}
cd ${TOOLCHAIN_PATH}
git clone git://github.com/raspberrypi/tools.git

echo "PATH=${PATH}:${TOOLCHAIN_PATH}/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> /root/.bashrc
if [ -n "${SSH_USER}" ]; then
    echo "PATH=${PATH}:${TOOLCHAIN_PATH}/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> /home/${SSH_USER}/.bashrc
fi

echo $TOOLCHAIN_PATH > ${STATUS_FILE}

exit 0
