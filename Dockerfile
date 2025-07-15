FROM openjdk:8-jre

WORKDIR /app
COPY . /app

RUN chmod +x gradlew

RUN ./gradlew build

CMD ["java", "-cp", "build/classes/java/main", "com.example.App"]