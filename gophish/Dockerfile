FROM alpine:latest

RUN apk update && apk add go tar wget openssl build-base libressl-dev musl-dev libffi-dev

WORKDIR /app
RUN wget https://github.com/gophish/gophish/archive/refs/tags/v0.11.0.tar.gz && \
    tar xvf v0.11.0.tar.gz && \
    cd gophish-0.11.0 && \
    go build && \
    mkdir database && \
    move gophish.db database/gophish.db && \
    openssl req -newkey rsa:2048 -nodes -keyout gophish.key -x509 -days 365 -out gophish.crt && \
    chmod 600 gophish.key gophish.crt && \
    chmod 777 gophish

VOLUME ["/app/gophish-0.11.0/database"]
COPY config.json /app/gophish-0.11.0/config.json
EXPOSE 3333 8080

ENTRYPOINT [ "./gophish" ]