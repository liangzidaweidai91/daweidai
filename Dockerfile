FROM --platform=linux/amd64 eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN apk add --no-cache wget && \
    wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

ENV JAVA_TOOL_OPTIONS="-Xmx128m -Xms64m"

ENV SPRING_R2DBC_URL=r2dbc:postgresql://ep-young-dawn-b3xh0sv8-c.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require
ENV SPRING_R2DBC_USERNAME=neondb_owner
ENV SPRING_R2DBC_PASSWORD=npq_8qPO0BWbLcSz

CMD ["java","-jar","halo.jar"]
