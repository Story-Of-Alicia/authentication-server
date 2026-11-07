FROM golang:1.26 AS build

WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -o /authentication-server ./cmd/authentication-server/main.go

CMD ["/authentication-server"]

FROM alpine:latest

COPY --from=build /authentication-server /bin/authentication-server
RUN chmod 0755 /bin/authentication-server

CMD ["/bin/authentication-server"]