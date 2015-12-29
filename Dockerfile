FROM registry.oco.example.com/project01/centos7:latest
MAINTAINER E.Nakai

RUN yum -y install epel-release; \
    yum -y install nginx
RUN mkdir -p /var/www; \
    echo 'Hello, World!' > /var/www/index.html
ADD files /
RUN chmod ugo+r /nginx.conf; \
    chmod ugo+rx /init.sh; \
    chmod -R ugo+r /var/www

USER nginx
EXPOSE 8080
CMD ["/init.sh"]
