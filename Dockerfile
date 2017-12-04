FROM alpine:3.7

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

ENV BOMBARDIER_VERSION v1.1
ENV UPSTREAM github.com/codesenberg/bombardier

ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Install dependencies for building httpdiff 
RUN apk --no-cache add ca-certificates && \
 apk --no-cache add --virtual build-dependencies curl git go musl-dev && \
 # Install bombardier client
 echo "Starting installing bombardier." && \
 go get -d $UPSTREAM && \
 cd $GOPATH/src/$UPSTREAM/ && git checkout $BOMBARDIER_VERSION && \
 go install $UPSTREAM && \
 apk del build-dependencies

ENTRYPOINT ["/gopath/bin/bombardier"]
#CMD [""]
