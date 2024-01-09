FROM ubuntu:latest
MAINTAINER abhishekshahane-docker
RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install zip -y
RUN apt-get install unzip -y
WORKDIR /var/www/html/
RUN zip -r /var/www/html/app.zip /var/www/html/* 
ADD /var/www/html/app.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip app.zip
RUN service nginx start
EXPOSE 80
ENTRYPOINT service nginx start && /bin/bash

