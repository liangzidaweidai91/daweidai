# 使用原生ARM64镜像，构建阶段完全原生，无QEMU模拟报错
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_TOOL_OPTIONS="-Xmx128m -Xms64m -XX:MaxMetaspaceSize=64m -XX:+UseSerialGC -XX:+UseCompressedOops -XX:-UsePerfData"

# 容器启动时，先判断有没有jar，没有就wget下载，然后启动；构建阶段不执行任何下载
ENTRYPOINT ["sh","-c","if [ ! -f halo.jar ]; then wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar; fi; java $JAVA_TOOL_OPTIONS -jar halo.jar"]
