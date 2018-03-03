# alpine/Bombardier

Auto trigger with latest release and build a docker image with the [bombardier](https://github.com/codesenberg/bombardier) ready to run.


### Running

```
docker run --rm -it alpine/bombardier --help 
```

### The Processes to build this image

The Processes to build this image
* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced in flake8 via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with latest version as tag and push to hub.docker.com
