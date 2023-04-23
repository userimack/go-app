FROM golang:alpine AS build_base

RUN apk add --no-cache make

WORKDIR /tmp/go-app

COPY . .

RUN make build-linux

FROM alpine:latest

COPY --from=build_base /tmp/go-app/out/go-app /app/go-app

EXPOSE 8080
CMD ["/app/go-app"]
