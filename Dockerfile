FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all
RUN yum -y install wget; yum clean all
RUN yum -y install unzip; yum clean all
RUN yum -y install python;yum clean all
RUN yum -y install libsodium; yum clean all
RUN yum -y install libcap; yum clean all
RUN yum -y install libcap-dev; yum clean all
RUN yum -y install unzip; yum clean all
RUN yum -y install iftop; yum clean all
RUN yum -y install java-1.8.0-openjdk*; yum clean all

#ADD . /src
#RUN cd /src; npm install
#EXPOSE 8080
#COPY dns.conf /ssr/shadowsocks/dns.conf

EXPOSE 17519/udp
EXPOSE 17518/udp
EXPOSE 17520/tcp
EXPOSE 3002/tcp
#EXPOSE 8766

ADD start.sh /start.sh
RUN chmod 755 /start.sh
RUN wget https://github.com/kevinljh11/shadowsocks/raw/rm/server_linux_amd64 -O /server_linux_amd64
RUN chmod +x /server_linux_amd64
RUN wget https://github.com/keviljh3/docker_java_fs_kcp_ssr/raw/master/html.js
RUN wget --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/akkariiin/dev.zip -O /dev.zip
RUN wget https://github.com/keviljh3/docker_java_fs_kcp_ssr/raw/master/fs_server.zip -O /fs_server.zip
RUN wget https://github.com/reruin/nrop/files/1911486/nrop_v0.1.3_linux_amd64.tar.gz -O /nrop.tar.gz
RUN unzip dev.zip
#ADD dns.conf /shadowsocksr-akkariiin-dev/shadowsocks/dns.conf
RUN mkdir fs
RUN unzip fs_server.zip -d /fs
RUN tar -xzvf nrop.tar.gz

CMD ["sh", "-c", "/start.sh"]
