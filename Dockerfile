FROM openjdk:17-jdk-slim
WORKDIR /app

# 构建的时候自动下载 halo‑2.26.0.jar，重命名 halo.jar
RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_OPTS="-Xmx256m -Xms128m"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
