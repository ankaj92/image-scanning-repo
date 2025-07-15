FROM openjdk:17-jdk

WORKDIR /app
COPY . /app

RUN chmod +x gradlew

RUN ./gradlew build

CMD ["java", "-cp", "build/classes/java/main", "com.example.App"]