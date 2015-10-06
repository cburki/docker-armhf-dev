Summary
-------

Docker image for armhf (Raspberry Pi) development with SSH server. This image
install the toolchain for cross compiling codes for Raspberry Pi. It includes
an SSH server in order to connect to the container and build projects. The
codes of your projects are stored in a volume.


Build the image
---------------

To create this image, execute the following command in the docker-armhf-dev folder.

    docker build \
        -t cburki/armhf-dev \
        .
        

Run the image
-------------

To access the SSH server you need to bind the port 22. You could attach a data
volume container where your codes are stored. I'm using a data volume container
where my codes are synchronized with Google Drive using Insync (see docker-insync
image).

    docker run \
        --name armhf-dev \
        --volumes-from armhf-dev-data \
        -e SSH_PASSWORD=<your secret password> \
        -e SSH_AUTHORIZED_KEY=<your ssh public key> \
        -p <external port>:22 \
		-d \
        cburki/armhf-dev:latest
