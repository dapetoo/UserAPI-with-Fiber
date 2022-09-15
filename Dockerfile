# syntax=docker/dockerfile:1

FROM golang:alpine3.16

WORKDIR /go/src/app

COPY go.mod /go/src/app
COPY go.sum /go/src/app
RUN go mod download

COPY *.go /go/src/app

RUN go get app
RUN go install

RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]
