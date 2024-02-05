FROM debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

# Install dependencies
RUN apt update && apt install mariadb-server -y

# Create DB
WORKDIR /home
COPY ./conf/script.sh script.sh
RUN bash script.sh

EXPOSE 3306

# Execute mariaDB
CMD [ "mysqld", "--bind-address=0.0.0.0" ]