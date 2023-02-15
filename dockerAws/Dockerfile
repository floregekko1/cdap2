FROM nginx:latest

RUN apt update
RUN apt install maven -y
RUN apt install openjdk-17-jdk openjdk-17-jre -y

WORKDIR /var/www/app

COPY default.conf /etc/nginx/conf.d

COPY ./target/dockerAws-0.0.1-SNAPSHOT.jar /var/www/app/dockerAws-0.0.1-SNAPSHOT.jar

EXPOSE 8081

CMD ["java", "-jar", "dockerAws-0.0.1-SNAPSHOT.jar"]