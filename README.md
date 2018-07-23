# Setting Up an Nginx SSL Reverse Proxy in a Docker Container

- This can be used to serve SSL traffic to Clojure Ring applications
  developed as shown in [Setting Up a Docker Development and Production Environment for Clojure and Postgresql Applications](https://github.com/davidneu/docker-clojure-postgresql-example).

- Clone this repository.

- Rename the resulting directory to the name of the new project and
  cd into the directory.

- Change all references to the new project name by running
  $ ./set-project-name.sh newprojectname

- $ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

- $ docker build --force-rm -t myapp_reverse_proxy_image:latest .

- $ docker run -i --name myapp_reverse_proxy_container -p 443:443 --network myapp_default myapp_reverse_proxy_image:latest

- Notice that the myapp_reverse_proxy_container connects to the
  myapp_default network. 

- Point browser to https://localhost.

