FROM alpine:latest

RUN apk update && apk add go tar wget openssl build-base libressl-dev musl-dev libffi-dev

WORKDIR /app
RUN wget https://github.com/gophish/gophish/archive/refs/tags/v0.11.0.tar.gz && \
    tar xvf v0.11.0.tar.gz && \
    cd gophish-0.11.0 && \
    go build && \
    mkdir database && \
    chmod 777 gophish

VOLUME ["/app/gophish-0.11.0/database"]
COPY config.json /app/gophish-0.11.0/
COPY gophish.crt /app/gophish-0.11.0/
COPY gophish.key /app/gophish-0.11.0/
EXPOSE 3333 8080

WORKDIR /app/gophish-0.11.0

ENTRYPOINT [ "./gophish" ]