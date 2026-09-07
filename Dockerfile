FROM openjdk:17-jdk-slim

WORKDIR /application

RUN wget https://github.com/halo-dev/halo/releases/download/v2.20.0/halo-2.20.0.jar -O halo.jar

COPY application.yaml /application/config/application.yaml

ENV JAVA_TOOL_OPTIONS="-Xms128m -Xmx200m"

EXPOSE 8090

CMD ["java","-jar","/application/halo.jar"]
