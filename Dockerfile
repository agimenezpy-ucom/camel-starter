# Build stage: compile the Spring Boot Camel application with Gradle
FROM gradle:9.7-jdk21 AS build
WORKDIR /home/gradle/project
COPY build.gradle settings.gradle ./
COPY src ./src
COPY routes ./routes
RUN gradle --no-daemon clean bootJar

# Runtime stage: run the built Spring Boot fat jar
FROM eclipse-temurin:21-jre AS runtime
WORKDIR /app
COPY --from=build /home/gradle/project/build/libs/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
