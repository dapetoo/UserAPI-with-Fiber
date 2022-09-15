# syntax=docker/dockerfile:1
FROM golang:alpine3.16 AS builder
RUN go version
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build  -o /app
CMD ["/app"]
EXPOSE 8080

#########
# second stage to obtain a very small image
FROM scratch
COPY --from=builder /app .
EXPOSE 8000
CMD ["/app"]
