# Docker-Bombardier

[![Build Status](https://travis-ci.org/Cyconet/docker-bombardier.svg?branch=development)](https://travis-ci.org/Cyconet/docker-bombardier)
[![Docker Build Status](https://img.shields.io/docker/build/waja/bombardier.svg)](https://hub.docker.com/r/waja/bombardier/)
[![GitHub tag](https://img.shields.io/github/tag/Cyconet/docker-bombardier.svg)](https://github.com/Cyconet/docker-bombardier/tags)
[![](https://img.shields.io/docker/pulls/waja/bombardier.svg)](https://hub.docker.com/r/waja/bombardier/)
[![](https://img.shields.io/docker/stars/waja/bombardier.svg)](https://hub.docker.com/r/waja/bombardier/)
[![](https://img.shields.io/docker/automated/waja/bombardier.svg)](https://hub.docker.com/r/waja/bombardier/)

Builds a docker image with the [bombardier](https://github.com/codesenberg/bombardier) ready to run.

Running
-------

- run the docker container with:

```
docker run --rm -it waja/bombardier --help 
```

Building
--------

```
make build
```

Get a shell in a running container
----------------------------------

```
make shell
```
