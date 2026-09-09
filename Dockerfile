FROM openjdk:21-jre-slim

WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

# JVM内存配置
ENV JAVA_TOOL_OPTIONS="-Xmx256m -Xms128m"

# Neon数据库连接信息
ENV SPRING_R2DBC_URL=r2dbc:postgresql://ep-young-dawn-b3xh0sv8-c.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require
ENV SPRING_R2DBC_USERNAME=neondb_owner
ENV SPRING_R2DBC_PASSWORD=npq_8qPO0BWbLcSz

CMD ["java","-jar","halo.jar"]
