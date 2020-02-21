# nginx 镜像
FROM arm32v7/nginx:latest as build-stage
# 维护者信息
MAINTAINER CrazyBunQnQ "crazybunqnq@gmail.com"

# 移除 nginx 容器的 default.conf 文件、nginx 配置文件
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

# 拷贝项目到 nginx 下运行
COPY . /usr/share/nginx/html

# 把 nginx.conf 文件复制到 nginx 容器的 /etc/nginx 文件夹下
RUN mv /usr/share/nginx/html/nginx.conf /etc/nginx/

# 暴露端口
EXPOSE 80
