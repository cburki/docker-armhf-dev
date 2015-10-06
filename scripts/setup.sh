#!/bin/bash

STATUS_FILE=/opt/rpi_toolchain.status
TOOLCHAIN_PATH=/opt/rpi_toolchain

if [ -f ${STATUS_FILE} ]; then

    echo "Toolchain already installed, exiting"
    exit 0
fi

echo "Installing the toolchain"
mkdir -p ${TOOLCHAIN_PATH}
cd ${TOOLCHAIN_PATH}
git clone git://github.com/raspberrypi/tools.git

echo "PATH=${PATH}:${TOOLCHAIN_PATH}/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> /root/.bashrc

echo "done" > ${STATUS_FILE}
exit 0
