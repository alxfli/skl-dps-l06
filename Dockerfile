# Stage 1: Build the WAR file using Maven
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the package
RUN mvn clean package -DskipTests

# Stage 2: Run Tomcat with the built WAR file
FROM tomcat:10.1-jdk17

# Remove default Tomcat applications (optional, for a cleaner image)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the first stage
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port (Tomcat listens on 8080 by default)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]