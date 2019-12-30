#Couchmovies Application Server
# Inheriting a Couchbase image ensures that the CB binaries are present. These are used to populate the data.
FROM couchbase:latest
MAINTAINER david.brown@couchbase.com

RUN apt-get update --fix-missing
# RUN sudo apt-get -y install git zip unzip jq maven vim openjdk-8-jdk python chromium-chromedriver
RUN apt-get -y install git zip unzip jq maven vim openjdk-8-jdk python 

RUN git clone https://github.com/escapedcanadian/couchmovies.git /opt/couchmovies


RUN /opt/couchmovies/build/buildServer

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
