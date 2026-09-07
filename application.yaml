FROM eclipse-temurin:17-jre-alpine

ENV SPRING_R2DBC_PASSWORD=npg_hyCUG90o1jLn
ENV JAVA_OPTS="-Xms60m -Xmx160m -XX:+UseSerialGC"

WORKDIR /app
COPY halo.jar app.jar

EXPOSE 8090
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
