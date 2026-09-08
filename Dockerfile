FROM eclipse-temurin:21-jre

RUN apt-get update && apt-get install -y --no-install-recommends wget && rm -rf /var/lib/apt/lists/*

ENV JAVA_OPTS="-Xms60m -Xmx140m -XX:+UseSerialGC -XX:MaxMetaspaceSize=128m"
ENV SPRING_PROFILES_ACTIVE=prod

ENV SPRING_R2DBC_URL=r2dbc:mysql://gateway01ap‑southeast‑1‑prod.aws.tidbcloud.com:4000/halodb?ssl‑mode=REQUIRED
ENV SPRING_R2DBC_USERNAME=2Ur133XyPKnjGjtroot
ENV SPRING_R2DBC_PASSWORD=kNCZ21cx0S7MShjp
ENV HALO_EXTERNAL_URL=http://halo‑9bb51.containers.snapdeploy.app/

WORKDIR /app

RUN wget https://dl.halo.run/release/halo‑2.26.0.jar -O app.jar

EXPOSE 8090
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
