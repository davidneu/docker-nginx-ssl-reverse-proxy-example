FROM nginx

COPY html /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf

COPY cert.pem /etc/nginx/cert.pem

COPY key.pem /etc/nginx/key.pem

