FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN wget https://dl.halo.run/release/halo-2.26.0.jar -O app.jar

COPY application.yaml /app/config/application.yaml

# 进一步压低内存，减小堆、元空间；关闭不必要JVM特性降低开销
ENV JAVA_TOOL_OPTIONS="-Xmx192m -Xms96m -XX:MaxMetaspaceSize=96m -XX:+UseSerialGC -XX:-UseCompressedOops"

EXPOSE 8090

CMD ["java", "-jar", "app.jar"]
