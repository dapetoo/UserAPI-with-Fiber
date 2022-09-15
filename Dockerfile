# syntax=docker/dockerfile:1

FROM golang:alpine3.16

WORKDIR /go/src/app

COPY go.mod ./app
COPY go.sum ./app
RUN go mod download

COPY *.go ./app

RUN go get app
RUN go install

RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]
