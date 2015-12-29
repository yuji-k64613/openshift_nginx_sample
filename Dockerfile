FROM registry.oco.example.com/project01/centos7:latest
MAINTAINER E.Nakai

RUN yum -y install epel-release; \
    yum -y install nginx
RUN useradd start; \
    mkdir -p /var/www; \
    echo 'Hello, World!' > /var/www/index.html
ADD nginx.conf /home/start/nginx.conf
ADD init.sh /home/start/init.sh
RUN chown start.start /home/start/nginx.conf; \
    chown start.start /home/start/init.sh; \
    chmod u+x /home/start/init.sh

EXPOSE 8080
USER start
CMD ["/home/start/init.sh"]
