FROM eclipse-temurin:21-jre

WORKDIR /app

COPY app.jar /app/app.jar
COPY application.yaml /app/config/application.yaml

ENV JAVA_TOOL_OPTIONS="-Xmx192m -Xms96m -XX:MaxMetaspaceSize=96m -XX:+UseSerialGC"

EXPOSE 8090

CMD ["java", "-jar", "app.jar"]
