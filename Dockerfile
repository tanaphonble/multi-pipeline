FROM golang:1.11.4-alpine3.8 as build-env

ENV GO111MODULE=on

COPY ./go.mod ./go.sum ./src ./
RUN go mod download

RUN cd /src && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o goapp main.go

FROM alpine:3.8
WORKDIR /app
COPY --from=build-env /src/goapp .
ENTRYPOINT ./goapp
