FROM golang:alpine
RUN apk add --no-cache openssh-client ca-certificates make gcc musl-dev bzr git mercurial subversion 

RUN go get github.com/Masterminds/glide && \
	go get github.com/kardianos/govendor
