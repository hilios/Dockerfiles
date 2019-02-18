FROM nginx:1.15.8

EXPOSE 80 443

COPY ./credentials.json /etc/credentials.json

RUN apt-get update \
    && apt-get install -y python3-pip \
    && chmod a+rwx,u-x,g-rwx,o-rwx /etc/credentials.json \
    && pip3 install -U --no-cache-dir pip certbot certbot-dns-google certbot-dns-route53 \
    && certbot certonly --non-interactive \
                        --dns-google \
                        --dns-google-credentials /etc/credentials.json \
                        --server https://acme-v02.api.letsencrypt.org/directory \
                        --register-unsafely-without-email \
                        --agree-tos \
                        -d hilios.com.br \
                        -d *.hilios.com.br \
                        -d edsonhilios.com.br \
                        -d *.edsonhilios.com.br \
    && echo "#!/bin/sh; certbot renew --post-hook \"nginx -s reload\"" > /etc/cron.daily/certbot-renew \
    && chmod a+x /etc/cron.daily/certbot-renew;

VOLUME /etc/letsencrypt

COPY ./nginx.conf /etc/nginx/nginx.conf
