FROM debian:jessie
MAINTAINER Per Abich <per.abich@gmail.com>

RUN apt-get update && apt-get install -y unzip ca-certificates

RUN apt-get clean
ADD consul_0.5.2_linux_amd64.zip /consul.zip
ADD consul_0.5.2_web_ui.zip /consul-ui.zip
RUN mkdir consul
ADD consul-conf.json /consul/consul-config.json
WORKDIR /consul
RUN unzip /consul.zip && unzip /consul-ui.zip
EXPOSE 8500 8400 8300 8600 8301 8302
VOLUME ["/data"]

CMD ["./consul", "agent", "-server", "-bootstrap-expect=1", "-config-file", "consul-config.json", "-ui-dir=/consul/dist", "-client=0.0.0.0"]
