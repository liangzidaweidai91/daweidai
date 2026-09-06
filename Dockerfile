FROM eclipse-temurin:21-jre
WORKDIR /app
# 不跑Halo，只打印日志，休眠
CMD echo "容器成功启动！" && sleep 600
