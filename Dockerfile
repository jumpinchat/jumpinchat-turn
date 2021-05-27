FROM phusion/baseimage
MAINTAINER Zaccary Price

ENV HOME /root
ENV SCRIPTS_DIR /tmp/scripts

CMD ["/sbin/my_init"]

RUN apt-get update && \
      apt-get dist-upgrade -y && \
      apt-get install -y \
        curl \
        build-essential \
        python \
        coturn


ADD ./init.sh /tmp

RUN /tmp/init.sh

ADD turnserver.sh /etc/turnserver.sh
RUN chmod +x /etc/turnserver.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT /etc/turnserver.sh
