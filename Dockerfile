FROM openjdk:17
WORKDIR /app
ADD /target/devops-integration.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
