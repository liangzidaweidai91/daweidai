FROM halo:2.26.0
COPY application.yaml /root/.halo2/application.yaml
ENV JAVA_OPTS="-Xmx160m -Xms100m -XX:MaxMetaspaceSize=80m -XX:+UseSerialGC"
