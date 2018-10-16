#!/bin/sh

if [ $# -eq 1 ]; then
    sed -i "s/myapp/$1/g" README.md
    sed -i "s/myapp/$1/g" nginx.conf
    sed -i "s/myapp/$1/g" html/custom_404.html
    sed -i "s/myapp/$1/g" html/custom_50x.html
    sed -i "s/myapp/$1/g" myapp_nginx_ssl_reverse_proxy
    mv myapp_nginx_ssl_reverse_proxy "$1_nginx_ssl_reverse_proxy"
else
    echo "Usage: $0 project_name"
fi

