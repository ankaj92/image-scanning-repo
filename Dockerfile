FROM openjdk:17-jdk AS runtime

WORKDIR /app

COPY build/libs/image-scanning.jar /app/app.jar

CMD ["java", "-jar", "/app/app.jar"]