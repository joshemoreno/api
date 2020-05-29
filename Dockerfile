FROM openshift/base-centos7
MAINTAINER Jose Moreno
RUN yum install httpd -y
RUN yum install epel-release -y
RUN yum install python-pip -y
RUN pip install flask
RUN yum install mod_wsgi -y
COPY httpd.conf/ /etc/httpd/conf/
WORKDIR /var/www/apirest/app
COPY apirest/ /var/www/apirest
COPY apirest/app /var/www/apirest/app
RUN chmod -R 777 /var/www
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
