# Setting Up an Nginx SSL Reverse Proxy in a Docker Container

- This can be used to serve SSL traffic to Clojure Ring applications
  developed as shown in [Setting Up a Docker Development and Production Environment for Clojure and Postgresql Applications](https://github.com/davidneu/docker-clojure-postgresql-example).

- Clone this repository.

- Rename the resulting directory to the name of the new project and
  cd into the directory.

- Change all references to the new project name by running
  $ ./set-project-name.sh newprojectname

- Correct the server_name entry in nginx.conf.

- Correct the proxy_pass entry in nginx.conf.

- Generate key and certificate with password
  $ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

- Generate key and certificate without password
  $ openssl req -x509 -new -nodes      -keyout key.pem -out cert.pem -days 365

- $ docker build --force-rm -t myapp_nginx_ssl_reverse_proxy_image:latest .
  Or use $ ./myapp_nginx_ssl_reverse_proxy build

- Start the docker container that runs myapp_nginx_ssl_reverse_proxy.
  Or use $ ./myapp_nginx_ssl_reverse_proxy run

  1. Use the host network

  - Run (Use proxy_pass https://localhost:4443; or proxy_pass https://myapp-clj-dev.example.com; in nginx.conf)
    $ docker run -i --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network host myapp_nginx_ssl_reverse_proxy_image:latest

  - Run in the background (Use proxy_pass https://localhost:4443; or proxy_pass https://myapp-clj-dev.example.com; in nginx.conf)
    $ docker run -d --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network host myapp_nginx_ssl_reverse_proxy_image:latest

  2. Use the myapp_default network

  - Run  (Use proxy_pass https://clj-dev:4443; in nginx.conf)
    $ docker run -i --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network myapp_default myapp_nginx_ssl_reverse_proxy_image:latest

  - Run in the background (Use proxy_pass https://clj-dev:4443; in nginx.conf)
    $ docker run -d --name myapp_nginx_ssl_reverse_proxy_container -p 443:443 -p 80:80 --network myapp_default myapp_nginx_ssl_reverse_proxy_image:latest

- Point browser to https://localhost.

- Clean up before rebuilding the image
  $ ./myapp_nginx_ssl_reverse_proxy clean

