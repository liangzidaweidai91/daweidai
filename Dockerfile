FROM eclipse-temurin:21-jre
WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_OPTS="-Xmx180m -Xms128m -XX:MaxMetaspaceSize=100m -XX:+UseSerialGC"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
