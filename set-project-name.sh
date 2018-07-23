#!/bin/sh

if [ $# -eq 1 ]; then
    sed -i "s/myapp/$1/g" README.org
    sed -i "s/myapp/$1/g" html/custom_404.html
    sed -i "s/myapp/$1/g" html/custom_50x.html
else
    echo "Usage: $0 project_name"
fi

