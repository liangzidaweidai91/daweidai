FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O halo.jar

COPY application.yaml /root/.halo2/application.yaml

# 极限压缩，牺牲性能换取最小内存，SerialGC单线程减少CPU开销
ENV JAVA_OPTS="-Xmx96m -Xms48m -XX:MaxMetaspaceSize=48m -XX:+UseSerialGC -XX:+UseCompressedOops -XX:-UsePerfData"

ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar halo.jar"]
