# Use an old, vulnerable base image for demonstration
FROM openjdk:8-jre

WORKDIR /app
COPY . /app

RUN ./gradlew build

CMD ["java", "-cp", "build/classes/java/main", "com.example.App"]