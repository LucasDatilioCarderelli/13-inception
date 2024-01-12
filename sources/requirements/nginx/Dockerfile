FROM debian:bullseye

ARG LOGIN

RUN apt update
RUN apt install -y \
    nginx \
    openssl

RUN sed -i "s/\${LOGIN}/$LOGIN/g" /etc/nginx/nginx.conf

RUN mkdir -p etc/nginx/self-signed-certs
RUN if [ ! -f /etc/nginx/self-signed-certs/self-signed-key.pem ]; then \
    openssl req \
    -x509 \
    -newkey \
    rsa:4096 \
    -sha256 \
    -days 365 \
    -nodes \
    -keyout /etc/nginx/self-signed-certs/self-signed-key.pem \
    -out /etc/nginx/self-signed-certs/self-signed-cert.pem \
    -subj "/C=BR/ST=SP/L=São Paulo/O=42 São Paulo/OU=${LOGIN}/CN=${LOGIN}"; \
fi

CMD ["nginx", "-g", "daemon off;"]
