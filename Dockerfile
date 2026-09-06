FROM eclipse-temurin:21-jre
WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_OPTS="-Xmx160m -Xms100m -XX:MaxMetaspaceSize=80m -XX:+UseSerialGC -Dhalo.initialization.delay=45000"

# 先休眠42秒，延后应用启动，尝试错开平台快速健康检测
ENTRYPOINT ["sh","-c","sleep 42 && java $JAVA_OPTS -jar halo.jar"]
