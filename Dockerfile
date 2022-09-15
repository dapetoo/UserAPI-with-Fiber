# syntax=docker/dockerfile:1

FROM golang:alpine3.16

WORKDIR /go/src/app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

WORKDIR /go/src/myapp
RUN go get app
RUN go install

RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]
