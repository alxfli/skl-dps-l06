# Java Tomcat Maven Example

Учебный HTTP-сервис на Java

## Сборка образа

    docker build -t my-java-app .

## Запуск

    docker run -d -p 8080:8080 my-java-app

Сервис слушает 127.0.0.1:8080

## Проверка

    curl -i http://localhost:8080/
