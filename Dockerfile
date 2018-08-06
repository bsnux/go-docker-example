FROM golang:1.10
WORKDIR /go/src/github.com/bsnux/go-docker-example
COPY hello.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/bsnux/go-docker-example/hello .
CMD ["./hello"]
