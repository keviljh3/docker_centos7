FROM debian:latest
MAINTAINER The debian docker ssr<cloud-ops@centos.org>

RUN apt-get update
RUN apt-get install -y curl build-essential
#RUN apt-get install -y epel-release
RUN apt-get install -y nodejs npm
#RUN apt-get install -y npm
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y python
#RUN apt-get install -y libsodium
#RUN apt-get install -y libcap
RUN apt-get install -y libcap-dev
RUN apt-get install -y unzip
RUN apt-get install -y iftop
RUN apt-get install -y java-1.8.0-openjdk*

EXPOSE 17519/udp
EXPOSE 17518/udp
EXPOSE 17520/tcp
EXPOSE 17517/tcp
EXPOSE 3002/tcp

ADD start.sh /start.sh
RUN chmod 755 /start.sh
RUN wget https://github.com/kevinljh11/kcp_udp_fs/raw/master/kcps64_170120 -O /kcps64_170120
RUN chmod +x /kcps64_170120
RUN wget https://github.com/kevinljh11/kcp_udp_fs/raw/master/udp2raw_amd64 -O /udp2raw_amd64
RUN chmod +x /udp2raw_amd64
RUN wget https://github.com/keviljh3/docker_java_fs_kcp_ssr/raw/master/html.js
RUN wget --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/akkariiin/dev.zip -O /dev.zip
RUN wget https://github.com/keviljh3/docker_java_fs_kcp_ssr/raw/master/fs_server.zip -O /fs_server.zip
RUN wget https://github.com/reruin/nrop/files/1911486/nrop_v0.1.3_linux_amd64.tar.gz -O /nrop.tar.gz
RUN unzip dev.zip

RUN mkdir fs
RUN unzip fs_server.zip -d /fs
RUN tar -xzvf nrop.tar.gz

CMD ["sh", "-c", "/start.sh"]
