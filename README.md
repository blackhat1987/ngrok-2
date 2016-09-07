# ngrok 服务端基础域名的处理

在搭建 ngrok 服务端时，假如服务端使用的域名是 ngrok.example.com，那么用户默认情况下分配的是 xxx.ngrok.example.com 域名。但是如果想要在 ngrok.exmaple.com 这个域名下进行相关的使用说明，却是有点问题的因为用户默认连接是填写的通信地址是 ngrok.example.com:443，如果将 ngrok.example.com 解析到了不同的IP，那么客户端将无法连接成功，以下想到几种解决办法：

* 方案一：ngrok.example.com 与 *.ngrok.example.com 解析到同一服务器，同时在 ngrok 服务端前再使用 nginx 反向代理
* 方案二：ngrok.example.com 与 *.ngrok.example.com 解析到同一服务器，同时再运行一个
 ngrok 客户端，并且指定域名为 ngrok.example.com
* 方案三：ngrok.example.com 与 *.ngrok.example.com 解析到不同的服务器，同时在 ngrok.example.com 服务端使用 iptables 进行端口转发 (不推荐，因为客户端与服务端所有的数据流量都是通过 ngrok.example.com:4443 端口进行传输的)

# 其他

本仓库使用的是方案二，在 docker 中运行 ngrok 客户端

ngrok 服务器：ngrok.qiujun.me (小水管)
