FROM golang:1.11-rc-stretch as build-env

ENV GO111MODULE=on

COPY ./src /src
RUN cd /src && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o goapp main.go

FROM alpine:3.8
WORKDIR /app
COPY --from=build-env /src/goapp .
ENTRYPOINT ./goapp
