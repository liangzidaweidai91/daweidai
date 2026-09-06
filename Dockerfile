FROM halohub/halo:2.20.0

ENV JAVA_OPTS="-Xmx192m -Xms192m -XX:MaxMetaspaceSize=96m -XX:MaxDirectMemorySize=64m"
ENV SERVER_PORT=8090
ENV TZ=Asia/Shanghai
