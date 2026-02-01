FROM ubuntu
RUN apt-get -y update && apt-get -y install nginx golang

COPY "default" "/etc/nginx/sites-available/default"

EXPOSE 8080/tcp

RUN mkdir -p "/opt/auth/cmd"

COPY "../cmd/server.go" "/opt/auth/cmd/server.go"
COPY "../go.mod" "/opt/auth/go.mod"

CMD ["./init.sh"]
