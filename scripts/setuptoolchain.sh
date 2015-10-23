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

echo 'PS1="\[\e[00;36m\][\$?]\[\e[0m\]\[\e[00;30m\] \[\e[0m\]\[\e[00;32m\]\u@\h\[\e[0m\]\[\e[00;30m\] \[\e[0m\]\[\e[00;34m\][\W]\[\e[0m\]\[\e[00;30m\] \\$ \[\e[0m\]"' >> /root/.bashrc
echo "PATH=${PATH}:${TOOLCHAIN_PATH}/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> /root/.bashrc

echo $TOOLCHAIN_PATH > ${STATUS_FILE}

exit 0
