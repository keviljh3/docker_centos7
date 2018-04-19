FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all
RUN yum -y install wget; yum clean all
RUN yum -y install unzip; yum clean all

#ADD . /src
#RUN cd /src; npm install
#EXPOSE 8080
RUN wget https://github.com/keviljh3/docker_java_fs_kcp_ssr/raw/master/html.js

CMD ["node", "html.js"]
