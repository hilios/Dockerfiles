FROM nginx:alpine

EXPOSE 80 443

COPY ./credentials.json /etc/credentials.json

RUN apk add --no-cache --upgrade certbot fail2ban py-pip \
    && chmod a+rwx,u-x,g-rwx,o-rwx /etc/credentials.json \
    && pip install -U --no-cache-dir pip certbot certbot-dns-google certbot-dns-route53 \
    && certbot certonly --non-interactive \
                        --dns-google \
                        --dns-google-credentials /etc/credentials.json \
                        --server https://acme-v02.api.letsencrypt.org/directory \
                        --register-unsafely-without-email \
                        --agree-tos \
                        -d *.hilios.com.br,*.edsonhilios.com.br;

COPY ./nginx.conf /etc/nginx/nginx.conf
