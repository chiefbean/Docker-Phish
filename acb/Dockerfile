FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git nginx python3 python3-pip python3-venv libaugeas0

RUN git clone https://github.com/chiefbean/AutoCertBot.git /app && \
    cd /app && \
    pip3 install --upgrade pip && \
    pip3 install Flask Jinja2 bcrypt requests cryptography

RUN mkdir /opt/certbot/ && \
    python3 -m venv /opt/certbot/ && \
    /opt/certbot/bin/pip install --upgrade pip && \
    /opt/certbot/bin/pip install certbot certbot-nginx && \
    ln -s /opt/certbot/bin/certbot /usr/bin/certbot

RUN service nginx start

COPY config.json /app/webserver/
EXPOSE 3000 443 80
WORKDIR /app/webserver

ENTRYPOINT ["python3", "index.py"]