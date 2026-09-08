FROM eclipse-temurin:21-jre

RUN apt-get update && apt-get install -y --no-install-recommends wget && rm -rf /var/lib/apt/lists/*

ENV JAVA_OPTS="-Xms60m -Xmx140m -XX:+UseSerialGC -XX:MaxMetaspaceSize=80m"
ENV SPRING_PROFILES_ACTIVE=prod

WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O app.jar

EXPOSE 8090
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
