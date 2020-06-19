FROM web-server-nginx

MAINTAINER anorqiu@163.com

#deploy my-website
COPY ./hello-container/index.html /usr/share/nginx/html/ 
COPY ./hello-container/img/docker.png /usr/share/nginx/html/ 

CMD ["/usr/sbin/init"]

