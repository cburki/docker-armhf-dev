FROM debian:jessie
MAINTAINER Christophe Burki, christophe@burkionline.net

# Install system requirements
RUN apt-get update && apt-get install -y \
    automake \
    emacs24-nox \
    git \
    libtool \
    libtool-bin \
    locales \
    make \
    openssh-server \
    python2.7 \
    pwgen \
    swig2.0

# Configure locales and timezone
RUN locale-gen en_US.UTF-8 en_GB.UTF-8 fr_CH.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime
RUN echo "Europe/Zurich" > /etc/timezone

# Configure sshd
RUN mkdir /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh

# s6 install and config
COPY bin/* /usr/bin/
COPY configs/etc/s6 /etc/s6/

# install setup scripts
COPY scripts/* /opt/
RUN chmod a+x /opt/setuptoolchain.sh
RUN chmod a+x /opt/setupusers.sh

EXPOSE 22

CMD ["/usr/bin/s6-svscan", "/etc/s6"]
