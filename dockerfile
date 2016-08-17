FROM debian:jessie
MAINTAINER bitkwan@gmail.com
RUN echo "deb http://httpredir.debian.org/debian/ jessie main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y openssh-server supervisor wget
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN mkdir -pv /etc/supervisor/conf.d/
RUN wget https://raw.githubusercontent.com/bitkwan/Debian8-Supervisord-docker/master/conf/supervisord.conf -O /etc/supervisor/supervisord.conf
RUN wget https://raw.githubusercontent.com/bitkwan/Debian8-Supervisord-docker/master/conf/supervisord.d.conf -O /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]