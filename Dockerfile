# Use Maven to build the app (build stage)
FROM maven:3.9.4-eclipse-temurin-17 as build

# Set working directory inside container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Run Maven to package the application
RUN mvn clean package -DskipTests

# Use a lightweight JDK image to run the app (runtime stage)
FROM eclipse-temurin:17-jdk-jammy

# Set working directory for runtime container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/bookstore-0.0.1-SNAPSHOT.jar app.jar

# Tell Docker how to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
