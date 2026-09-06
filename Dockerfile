# ==========第一阶段：builder，强制amd64，在这里下载jar ==========
FROM --platform=linux/amd64 eclipse-temurin:21-jre-alpine AS builder
WORKDIR /build
# 这一段RUN跑在amd64 builder容器内部，不是ARM宿主机，不会exec format error
RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

# ==========第二阶段：最终运行镜像 ==========
FROM --platform=linux/amd64 eclipse-temurin:21-jre-alpine
WORKDIR /app

# 从builder复制已经下载好的jar，COPY只是拷贝，不执行程序
COPY --from=builder /build/halo.jar /app/halo.jar

COPY application.yaml /root/.halo2/application.yaml

ENV JAVA_TOOL_OPTIONS="-Xmx96m -Xms48m -XX:MaxMetaspaceSize=48m -XX:+UseSerialGC -XX:+UseCompressedOops -XX:-UsePerfData"

ENTRYPOINT ["sh","-c","java $JAVA_TOOL_OPTIONS -jar halo.jar"]
