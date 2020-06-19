FROM centos7-systemd

MAINTAINER anorqiu@163.com

#install net-tools
RUN set -x \
	&& yum -y install net-tools

#to install nginx
##add repo info for installing nginx
ADD ./conf/nginx.repo /etc/yum.repos.d/nginx.repo 

##install nginx
RUN set -x \
	&& yum -y install nginx

##enable that nginx started when the container startups
RUN set -x \
	&& systemctl enable nginx

EXPOSE 80

CMD ["/bin/bash"]
