FROM debian:jessie
MAINTAINER Per Abich <per.abich@gmail.com>

RUN apt-get update && apt-get install -y unzip ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD consul_0.6.4_linux_amd64.zip /consul.zip
ADD consul_0.6.4_web_ui.zip /consul-ui.zip
RUN mkdir consul
WORKDIR /consul
RUN unzip /consul.zip && unzip /consul-ui.zip -d dist
ADD entrypoint.sh /
ADD consul-conf.json /consul/consul-config.json
EXPOSE 8500 8400 8300 8600 8301 8302 8301/udp 8302/udp 8600/udp
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
