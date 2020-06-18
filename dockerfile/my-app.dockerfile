FROM local/c7-nginx

MAINTAINER anorqiu@163.com

#deploy my-app
COPY ./hello-container/index.html /usr/share/nginx/html/ 

CMD ["/usr/sbin/init"]

