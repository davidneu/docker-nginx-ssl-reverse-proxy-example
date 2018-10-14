# Setting Up an Nginx SSL Reverse Proxy in a Docker Container

- This can be used to serve SSL traffic to Clojure Ring applications
  developed as shown in [Setting Up a Docker Development and Production Environment for Clojure and Postgresql Applications](https://github.com/davidneu/docker-clojure-postgresql-example).

- Clone this repository.

- Rename the resulting directory to the name of the new project and
  cd into the directory.

- Change all references to the new project name by running
  $ ./set-project-name.sh newprojectname

- Change the domain name from example.com in the server_name entry in nginx.conf.

- Generate key and certificate with password
  $ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

- Generate key and certificate without password
  $ openssl req -x509 -new -nodes      -keyout key.pem -out cert.pem -days 365

- $ docker build --force-rm -t myapp_nginx_ssl_reverse_proxy_image:latest .

- Start the docker container that runs myapp.

- Run  (Use proxy_pass https://clj-dev:4443; in nginx.conf)
  $ docker run -i --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network myapp_default myapp_nginx_ssl_reverse_proxy_image

- Run in the background (Use proxy_pass https://clj-dev:4443; in nginx.conf)
  $ docker run -d --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network myapp_default myapp_nginx_ssl_reverse_proxy_image

- Run (Use proxy_pass https://localhost:4443; or proxy_pass https://myapp-clj-dev.example.com; in nginx.conf)
  $ docker run -i --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network host myapp_nginx_ssl_reverse_proxy_image

- Run in the background (Use proxy_pass https://localhost:4443; or proxy_pass https://myapp-clj-dev.example.com; in nginx.conf)
  $ docker run -d --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network host myapp_nginx_ssl_reverse_proxy_image

- Notice that the myapp_nginx_ssl_reverse_proxy_container connects to the
  myapp_default network.

- Point browser to https://localhost.

- Before rebuilding the image:
  - docker container stop myapp_nginx_ssl_reverse_proxy_container
  - docker container rm myapp_nginx_ssl_reverse_proxy_container --volumes
  - docker image rm myapp_nginx_ssl_reverse_proxy_image:latest
  that is,
  - docker container stop myapp_nginx_ssl_reverse_proxy_container; docker container rm myapp_nginx_ssl_reverse_proxy_container --volumes;  docker image rm myapp_nginx_ssl_reverse_proxy_image:latest

