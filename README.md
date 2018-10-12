### NoIP client

NoIP client running in docker. Because we must configure the client in interactive mode, run a container for the first time with a shared volume:
```
docker run -it --rm -v `pwd`/noipconf:/usr/local/etc mqll/noip
```

Then kill the container.

Run:
```
docker run -d  -v `pwd`/noipconf:/usr/local/etc --name noip mqll/noip
```
