FROM openjdk:21-jdk-slim
WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_OPTS="-Xmx256m -Xms128m"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
