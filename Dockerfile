FROM nginx:stable
MAINTAINER Jun.Qiu <i@qiujun.me>

WORKDIR /root

ADD ngrok.conf .ngrok
ADD linux_amd64 linux_amd64
ADD nginx.conf /etc/nginx/conf.d/default.conf

CMD service nginx start && ./linux_amd64 start-all
