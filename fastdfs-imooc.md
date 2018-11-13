```
167  cd soft/
  168  ls
  169  yum -y install libevent
  170  cd fastDFS/
  171  tar zvxf libfastcommon-1.0.7.tar.gz 
  172  cd libfastcommon-1.0.7
  173  ls
  174  ./make.sh 
  175  ./make.sh install 
  176  history 
  177  ./make.sh install 
  178  cd /usr/lib64
  179  ls
  180  ll libfast*
  181  cp libfastcommon.so /usr/lib
  182  ls /usr/lib
  183  基本环境ok
  184  history 
  185  cd
  186  cd soft/
  187  cd fastDFS/
  188  ls
  189  tar zvxf fastdfs-5.05.tar.gz 
  190  ls
  191  cd fastdfs-5.05
  192  ls
  193  ll
  194  ./make.sh 
  195  ./make.sh install
  196  cd /usr/bin/
  197  ls
  198  ls fdfs_*
  199  ls /etc/fdfs/
  200  cd 
  201  cd soft/
  202  cd fastDFS/
  203  ls
  204  cd fastdfs-5.05
  205  ll
  206  cd conf/
  207  ls
  208  cp ./* /etc/fdfs/
  209  cd /etc/fdfs/
  210  l
  211  ls
  212  nano tracker.conf
  213  mkdir -p /fastdfs/tracker
  214  ll
  215  ll /
  216  ll /fastdfs/
  217  cd /fastdfs/
  218  mkdir storage
  219  mkdir client
  220  ls
  221  cd /etc/fdfs/
  222  ls
  223  cd /usr/bin/
  224  ll fdfs*
  225  fdfs_trackerd /etc/fdfs/tracker.conf
  226  ps -ef |grep fdfd
  227  fdfs_trackerd /etc/fdfs/tracker.conf restart
  228  ps -ef |grep fdfs
  229  tracker完毕
  230  ll /fastdfs/
  231  cd /etc/fdfs/
  232  nano ./storage.conf
  233  /usr/bin/fdfs_storaged /etc/fdfs/storage.conf 
  234  ps -ef |grep fdfs
  235  /usr/bin/fdfs_storaged ./storage.conf 
  236  nano ./storage.conf
  		
  237  /usr/bin/fdfs_storaged ./storage.conf 
  238  ps -ef |grep fdfs
  239  nano ./storage.conf
  240  ifconfig 
  241  nano ./storage.conf
  242  /usr/bin/fdfs_storaged ./storage.conf 
  243  ps -ef |grep fdfs
  244  vim ./client.conf
  245  cd /usr/bin/
  246  ll fdfs_*
  247  fdfs_test /etc/fdfs/client.conf upload /root/2.png 
  248  ps -ef | grep nginx
  249  whereis nginx
  250  docker stop image
  251  docker ps
  252* 
  253  fdfs_test /etc/fdfs/client.conf upload /root/2.png 
  254  find nginx
  255  ps -ef | grep nginx
  256  cd /fastdfs/storage/
  257  ls
  258  cd data/
  259  ls
  260  cd ./00/00/
  261  ls
  262  cd
  263  history 
```



```
./configure \--prefix=/usr/local/nginx \--pid-path=/var/run/nginx/nginx.pid \--lock-path=/var/lock/nginx.lock \--error-log-path=/var/log/nginx/error.log \--http-log-path=/var/log/nginx/access.log \--with-http_gzip_static_module \--http-client-body-temp-path=/var/temp/nginx/client \--http-proxy-temp-path=/var/temp/nginx/proxy \--http-fastcgi-temp-path=/var/temp/nginx/fastcgi \--http-uwsgi-temp-path=/var/temp/nginx/uwsgi \--http-scgi-temp-path=/var/temp/nginx/scgi \--add-module=/root/soft/fastDFS/fastdfs-nginx-module/src
```

