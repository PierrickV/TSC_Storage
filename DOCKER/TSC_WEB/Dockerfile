#!/bin/bash
# Pierrick VERAN - Tardigrade Security Challenge - 09/11/2015
# Create nginx container to share public challenge files
# Container should be launch with start_web.sh script
# Use "docker build --tag=tsc/storage:Web ." to build nginx image
FROM nginx
MAINTAINER veran@intechinfo.fr
# Set terminal to be noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	supervisor

ADD config_files config_files
WORKDIR /config_files

# Expose ports
# 80 = Nginx
EXPOSE 8080

# Configure Nginx
COPY /config_files/nginx.conf /etc/nginx/conf.d/default.conf

# Run Supervisor (i.e., start Nginx, and Gunicorn)
COPY /config_files/supervisord.conf /etc/supervisor/supervisord.conf
COPY /config_files/supervisord_nginx.conf /etc/supervisor/conf.d/supervisord_nginx.conf

#CMD /bin/bash
CMD ["/usr/bin/supervisord"]
