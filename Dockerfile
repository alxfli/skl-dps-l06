# Stage 1: build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
# loading dependencies
RUN mvn -B dependency:go-offline
COPY src ./src

# Stage 2: prod
FROM eclipse-temurin:17-jre-alpine AS prod

# install tomcat
RUN mkdir -p /opt/tomcat && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.60/bin/apache-tomcat-10.1.60.tar.gz \
      | tar -xz -C /opt/tomcat --strip-components=1 && \
    rm -rf /opt/tomcat/webapps/* /opt/tomcat/bin/*.bat /opt/tomcat/bin/*.exe

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]