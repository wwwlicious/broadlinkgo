FROM alpine:3.6
FROM golang
RUN cd src && git clone https://github.com/wwwlicious/broadlinkgo.git 
RUN go get github.com/GeertJohan/go.rice
RUN go get github.com/GeertJohan/go.rice/rice
RUN go get github.com/wwwlicious/broadlinkgo
EXPOSE 8000
RUN cd src/broadlinkgo/cmd && rice embed-go && go build -o broadlinkgo
CMD src/broadlinkgo/cmd/broadlinkgo
