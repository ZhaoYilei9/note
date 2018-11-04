https://www.jianshu.com/p/c336fd0bdfbe

### 下载SSR客户端

```
git clone https://github.com/ssrbackup/shadowsocksr
```

### 配置文件

进入刚才clone下来的文件夹， 有一个文件 `user-config.json` ，这个就是配置文件的模板，我们可以复制一份到/etc/shadowsocks.json，然后对这个文件进行配置：

```
{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "server_port": 8388,
    "local_address": "127.0.0.1",
    "local_port": 1080,

    "password": "m",
    "method": "aes-128-ctr",
    "protocol": "auth_aes128_md5",
    "protocol_param": "",
    "obfs": "tls1.2_ticket_auth_compatible",
    "obfs_param": "",
    "speed_limit_per_con": 0,
    "speed_limit_per_user": 0,

    "additional_ports" : {}, // only works under multi-user mode
    "additional_ports_only" : false, // only works under multi-user mode
    "timeout": 120,
    "udp_timeout": 60,
    "dns_ipv6": false,
    "connect_verbose_info": 0,
    "redirect": "",
    "fast_open": false
}
```

主要用到的配置是下面的这几个选项：

```
"server_port":8388,        //端口
"password":"password",     //密码
 "protocol":"origin",       //协议插件
 "obfs":"http_simple",      //混淆插件
 "method":"aes-256-cfb",    //加密方式
```

具体的服务器，密码，端口从SS帐号提供商那里获取

### 运行程序

进入到shadowsocksr/shadowsocks/目录里面，执行：

```
python local.py -c /etc/shadowsocks.json
```

出现下面的提示,说明运行成功

```
2017-10-17 12:30:49 INFO     local.py:50 local start with protocol[auth_chain_a] password [Ck6295iFwq] method [none] obfs [tls1.2_ticket_auth] obfs_param []
2017-10-17 12:30:49 INFO     local.py:54 starting local at 127.0.0.1:1080
2017-10-17 12:30:49 INFO     asyncdns.py:324 dns server: [('127.0.1.1', 53)]
2017-10-17 12:30:57 INFO     util.py:85 loading libcrypto from libcrypto.so.1.0.0
```

#### 结合SwitchyOmega 使用

上面的步骤其中的配置项有两个要注意：

```
"local_address": "127.0.0.1",                                                                                                                                                          
"local_port": 1080,
```

说明SSR客户端运行本地的127.0.0.1 IP， 监听端口1080
 所以再SwitchyOmega里面的配置就是

 

 

 

 

 