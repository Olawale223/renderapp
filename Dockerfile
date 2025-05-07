# Stage 1: build with the official Gradle image (includes Gradle 8.13 + JDK 17)
FROM gradle:8.13-jdk17 AS build

# (Optional) If you want to run as non‑root for better cache‑sharing:
USER gradle
WORKDIR /home/gradle/project

# Copy everything and build
COPY --chown=gradle:gradle . .
RUN gradle bootJar --no-daemon

# Stage 2: runtime image
FROM eclipse-temurin:17
WORKDIR /app

EXPOSE 8080

# Pull in your JAR from the build stage
COPY --from=build /home/gradle/project/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
