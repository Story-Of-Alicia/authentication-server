FROM golang:alpine AS build
RUN apk update
RUN apk add go

WORKDIR "/build"
COPY . .
RUN go mod download
RUN go build -v -o /usr/local/bin/auth cmd/main.go

FROM golang:alpine

COPY --from=build /usr/local/bin /usr/local/bin
CMD ["/usr/local/bin/auth"]