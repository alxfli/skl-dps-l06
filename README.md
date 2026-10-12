# Java Tomcat Maven Example

A sample Java HTTP service

## Building the image

    docker build -t my-java-app .

## Running Docker

    docker run -d -p 8080:8080 my-java-app

The service listens on 127.0.0.1:8080

## Running Docker compose

    docker compose up -d

## Building Docker compose

    docker compose up -d --build

## Verification

    curl -i http://localhost:8080/