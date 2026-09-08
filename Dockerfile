FROM eclipse-temurin:21-jre

RUN apt-get update && apt-get install -y --no-install-recommends wget && rm -rf /var/lib/apt/lists/*

ENV JAVA_OPTS="-Xms60m -Xmx140m -XX:+UseSerialGC -XX:MaxMetaspaceSize=128m"
ENV SPRING_PROFILES_ACTIVE=prod

ENV SPRING_R2DBC_URL=r2dbc:postgresql://ep-young-dawn-b3xh0sv8-pooler.c-4.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require
ENV SPRING_R2DBC_USERNAME=neondb_owner
ENV SPRING_R2DBC_PASSWORD=npg_VnjDsmIH1Sq6
ENV HALO_EXTERNAL_URL=http://halo-9f13c.containers.snapdeploy.app/

WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O app.jar

EXPOSE 8090
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
