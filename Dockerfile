FROM halohub/halo:2.20.0

ENV JAVA_OPTS="-Xmx128m -Xms128m -XX:MaxMetaspaceSize=64m -XX:MaxDirectMemorySize=32m -XX:+UseSerialGC -XX:+UseStringDeduplication -XX:-UsePerfData"
ENV TZ=Asia/Shanghai

CMD [ \
"--spring.r2dbc.url=r2dbc:postgresql://ep-young-dawn-b3xh0sv8-pooler.c-4.ap-southeast-1.aws.neon.tech:5432/neondb?sslMode=require", \
"--spring.r2dbc.username=neondb_owner", \
"--spring.r2dbc.password=npg_6dfBUc3zkbXe", \
"--spring.sql.init.platform=postgresql", \
"--server.port=8090", \
"--spring.jpa.open-in-view=false", \
"--halo.cache.page.enabled=false" \
]
