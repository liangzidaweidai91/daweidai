FROM halohub/halo:2.26.0

ENV JAVA_TOOL_OPTIONS="-Xmx192m -Xms128m"
ENV SPRING_R2DBC_URL=r2dbc:postgresql://ep-young-dawn-b3xh0sv8-pooler.c-4.ap-southeast-1.aws.neon.tech:5432/neondb?sslmode=require
ENV SPRING_R2DBC_USERNAME=neondb_owner
ENV SPRING_R2DBC_PASSWORD=npg_8qPO0BWbLcSz

EXPOSE 8090
