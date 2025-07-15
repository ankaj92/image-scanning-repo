FROM openjdk:17-jdk AS runtime

WORKDIR /app

# Copy only the compiled classes (or JAR) from the pipeline build context
#COPY build/classes/java/main/ /app/classes/
# If you build a JAR, use:
COPY build/libs/image-scanning.jar /app/app.jar

#CMD ["java", "-cp", "/app/classes", "com.example.App"]
# Or, if using a JAR:
CMD ["java", "-jar", "/app/app.jar"]