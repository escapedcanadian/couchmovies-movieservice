# couchmovies-movieservice
Code to build and run the RESTful service that fronts the Couchbase Server for the Couchmovies demo


### Building the movieservice container
Make sure you are in the ```movieservice``` directory.


```
docker build .
```
Assuming things went well, the last message of the ```build``` command should give you the id of the new image.  It should look something like ...

```
Successfully built e26804129abc
```
where ```e26804129abc``` is the containerId. Determine which version you wish to ```tag``` this container with - this should match the tag of the ```couchbase``` container that this ```movieservice``` will be used with.

Tag the newly created with a suitable tag.

```
docker tag <containerId> escapedcanadian/couchmovies-movieservice:<tag> 
```

If this is to be the ```latest``` version of the container, also add the latest tag.
```
docker tag <containerId> escapedcanadian/couchmovies-movieservice:latest 
```

Push the new container to the docker hub (you may need appropriate credentials).

```
docker push escapedcanadian/couchmovies-movieservice:<tag>
docker push escapedcanadian/couchmovies-movieservice:latest
```
