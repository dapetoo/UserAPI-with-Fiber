# syntax=docker/dockerfile:1
FROM golang:alpine3.16 AS builder
RUN go version
COPY . /app
WORKDIR /app

# COPY go.mod /go/src/app
# COPY go.sum /go/src/app
# RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /app
CMD ["/app"]

# COPY *.go /go/src/app

# RUN go get app
# RUN go install

# RUN go build -o /docker-gs-ping

EXPOSE 8080

#########
# second stage to obtain a very small image
FROM scratch

COPY --from=builder /fiber-app .

EXPOSE 8000

CMD ["/app"]
