#!/bin/bash

if [ -z $DEMO_DIR ];then
	export DEMO_DIR=/couchmovies
fi

if [ -z $CONTAINER ];then
	export CONTAINER=couchmovies
fi

if [ -z $IMAGE ];then
	export IMAGE=couchmovies
fi

if [ -z $CB_SERVER ];then
	export CB_SERVER=127.0.0.1
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
# echo "spring.couchbase.bootstrap-hosts=${CB_SERVER}" > /couchmovies/src/main/resources/application.properties
# echo "spring.couchbase.bucket.name=${CB_MOVIE_BUCKET}" >> /couchmovies/src/main/resources/application.properties
# echo "spring.couchbase.bucket.user=${CB_MOVIE_BUCKET}" >> /couchmovies/src/main/resources/application.properties
# echo "spring.couchbase.bucket.password=password" >> /couchmovies/src/main/resources/application.properties
# echo "spring.data.couchbase.auto-index=true" >> /couchmovies/src/main/resources/application.properties

#cd ~demo/couchmovies/movieservice
# mvn clean install

#sudo cp ./services/movieservice /etc/init.d/movieservice
#sudo chmod +x /etc/init.d/movieservice
#sudo update-rc.d movieservice defaults
#sudo service movieservice start

# sudo cp ./services/movieserver /etc/init.d/movieserver
# sudo chmod +x /etc/init.d/movieserver
# sudo update-rc.d movieserver defaults
# sudo service movieserver start

cd ~demo/couchmovies/movieservice
mvn spring-boot:run > couchmovies.log 2>&1 &

#Not ending process for container to run
tail -f /dev/null
