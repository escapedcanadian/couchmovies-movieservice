#!/bin/bash

if [ -z $DEMO_DIR ];then
	export DEMO_DIR=/opt/couchmovies/movieservice
fi

if [ -z $CONTAINER ];then
	export CONTAINER=couchmovies
fi

if [ -z $IMAGE ];then
	export IMAGE=couchmovies
fi

if [ -z $CB_SERVER ];then
	export CB_SERVER=couchbase
fi

export CB_ENGINE=couchbase://$CB_SERVER

if [ -z $CB_USER ];then
	export CB_USER=Administrator
fi

if [ -z $CB_PASSWORD ];then
	export CB_PASSWORD=password
fi

if [ -z $CB_MOVIE_BUCKET ];then
	export CB_MOVIE_BUCKET=moviedata
fi

if [ -z $CB_TWEET_SOURCE_BUCKET ];then
	export CB_TWEET_SOURCE_BUCKET=tweetsource
fi

if [ -z $CB_TWEET_TARGET_BUCKET ];then
	export CB_TWEET_TARGET_BUCKET=tweettarget
fi


# mv /couchmovies/src/main/resources/application.properties /couchmovies/src/main/resources/application.properties.bkup
echo "spring.couchbase.bootstrap-hosts=${CB_SERVER}" > $DEMO_DIR/src/main/resources/application.properties
echo "spring.couchbase.bucket.name=${CB_MOVIE_BUCKET}" >> $DEMO_DIR/src/main/resources/application.properties
echo "spring.couchbase.bucket.user=${CB_MOVIE_BUCKET}" >> $DEMO_DIR/src/main/resources/application.properties
echo "spring.couchbase.bucket.password=password" >> $DEMO_DIR/src/main/resources/application.properties
echo "spring.data.couchbase.auto-index=true" >> $DEMO_DIR/src/main/resources/application.properties

# Give time for the couchbase image to start
echo "Waiting 15 seconds to let the Couchbase Server start"
sleep 15

cd /opt/couchmovies/movieservice
#mvn spring-boot:run > couchmovies.log 2>&1 &
mvn spring-boot:run

#Not ending process for container to run
tail -f /dev/null
