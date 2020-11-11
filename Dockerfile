#base image
FROM ubuntu:latest

#author info
MAINTAINER wangdamingll "wangdamingll@163.com"

#env set
ENV APPLICATION_NAME test
ENV ENVIRONMENT development

#label set
LABEL Version="0.0.1" 

#add files to image
#ADD software.lic /opt/application/software.lic
RUN ["cp", "/etc/apt/sources.list", "/etc/apt/sources.list_bak"]
ADD sources.list /etc/apt/ 

#flush apt cache
ENV REFRESHED_AT 2020-11-11
RUN ["apt-get", "update"] 　
RUN ["apt-get", "install","-y","vim"] 　

#build args 
#ARG build
#ARG webapp_user=user

#set running container workdir
#WORKDIR /opt/test

#use what for running container
#USER root

#add image volume
#VOLUME ["/opt/project", "/data"]


#copy files to image
#COPY conf.d/ /etc/apache2/

#send signal for stoping container
#STOPSIGNAL

#use this image trigger
#ONBUILD ADD . /app/src
#ONBUILD RUN cd /app/src && make

#docker run cmd
ENTRYPOINT ["/bin/bash"]　
#CMD ["/bin/bash"]

