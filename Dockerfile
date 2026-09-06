FROM eclipse-temurin:21-jre
WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_OPTS="-Xmx160m -Xms100m -XX:MaxMetaspaceSize=80m -XX:+UseSerialGC"

ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
