# Use an official Maven image with Java 17 to build the app
FROM maven:3.8.7-amazoncorretto-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use a lightweight JDK 17 runtime image
FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]