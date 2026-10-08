# Этап 1: Сборка WAR-файла с помощью Maven
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Копируем файлы проекта
COPY pom.xml .
COPY src ./src

# Запускаем сборку пакета
RUN mvn clean package -DskipTests

# Этап 2: Запуск Tomcat с готовым WAR-файлом
FROM tomcat:10.1-jdk17

# Удаляем стандартные приложения Tomcat (опционально, для чистоты)
RUN rm -rf /usr/local/tomcat/webapps/*

# Копируем собранный WAR-файл из первого этапа
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Открываем порт (по умолчанию Tomcat слушает 8080)
EXPOSE 8080

# Запускаем Tomcat
CMD ["catalina.sh", "run"]