FROM openjdk:17-jdk-slim
WORKDIR /app
COPY halo.jar /app/halo.jar
COPY application.yaml /root/.halo2/application.yaml
ENV JAVA_OPTS="-Xmx256m -Xms128m"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
