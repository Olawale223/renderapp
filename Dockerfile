FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN chmod +x gradlew
RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:17
EXPOSE 8080
COPY --from=build /build/libs/renderapp-1.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
