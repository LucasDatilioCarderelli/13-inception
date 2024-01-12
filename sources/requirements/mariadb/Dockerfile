FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

WORKDIR /home
COPY ./conf/script.sh script.sh
RUN bash script.sh

EXPOSE 3306

CMD [ "mysqld", "--bind-address=0.0.0.0" ]