# syntax=docker/dockerfile:1
FROM golang:1.16

WORKDIR /build
ENV GO111MOODULE=on
COPY . .
RUN ls -la 
RUN CGO_ENABLED=0 GOOS=linux go build -o app /build/cmd/main.go 

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /build/app .
CMD ["./app"]  
