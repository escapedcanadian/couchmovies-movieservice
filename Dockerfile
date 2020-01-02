#Couchmovies Movieservice Container
FROM maven:3.6.3-jdk-8-openj9
MAINTAINER david.brown@couchbase.com

RUN apt-get -y install git

RUN git clone https://github.com/escapedcanadian/couchmovies-movieservice /opt/couchmovies/movieservice
WORKDIR /opt/couchmovies/movieservice

RUN mvn install -DskipTests

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
