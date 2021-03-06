## redis

### 配置

./redis-server redis.conf

### 常用命令

5种数据类型：

string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合) 

①string是redis最基本的类型，你可以理解成与Memcached一模一样的类型，一个key对应一个value。

string类型是二进制安全的。意思是redis的string可以包含任何数据。比如jpg图片或者序列化的对象 。

string类型是Redis最基本的数据类型，一个键最大能存储512MB。

```
redis 127.0.0.1:6379> SET name "runoob"
OK
redis 127.0.0.1:6379> GET name
"runoob"
```

②

Redis hash 是一个键值(key=>value)对集合。

Redis hash是一个string类型的field和value的映射表，hash特别适合用于存储对象。

```
redis> HMSET myhash field1 "Hello" field2 "World"
"OK"
redis> HGET myhash field1
"Hello"
redis> HGET myhash field2
"World"
hset myhash field1 hedshe
(integer) 0
127.0.0.1:6379> hset myhash field9 hehedada
(integer) 1
```

③常用命令

```
set hh 12
OK
127.0.0.1:6379> incr hh
(integer) 13
127.0.0.1:6379> decr hh
(integer) 12
127.0.0.1:6379> ttl hh 100
(error) ERR wrong number of arguments for 'ttl' command
127.0.0.1:6379> expire hh 100
(integer) 1
127.0.0.1:6379> ttl hh
(integer) 96
127.0.0.1:6379>	keys *
1) "myhash"
2) "hello"
3) "hh"
```

### jedis

```
	@Test
    public void test() throws Exception{

        Jedis jedis = new Jedis("192.168.1.18",6379 );
        jedis.set("hehe", "li");
        //jedis存放的全是字符串
        String result = jedis.get("hehe");
        System.out.println(result);
        //注意jedis用完一定要关闭
        jedis.close();
    }
```

每次链接都获取链接耗费时间与资源：启用jedis连接池：

```
 @Test
    public void testJedisPool()throws Exception{
        //创建数据库连接池对象（单例）模式，需要指定ip及端口号
        JedisPool jedisPool = new JedisPool("192.168.1.18",6379);
        //从连接池获取对象
        Jedis jedis = jedisPool.getResource();

        //使用jedis操作数据库（方法级别使用）
        String s = jedis.get("hehe");
        //用完之后一定要关闭
        System.out.println(s);
    } 
```

redis单线程照样快,不适合存大数据,适合缓存，能快速处理完的

### redis集群

①删除dump.rdb

②修改redis.conf==>/port 6379

​			===>cluster-enabled=yes

###　开机自启动

```
[root@localhost ~]# vi /etc/init.d/redis
```

```
复制下面代码到脚本中(注意要修改里面redis的安装路径,不清楚find查找下)
(这段代码就是redis根目录 /utils/redis_init_script 启动脚本的代码)
```

```
#!/bin/sh
# chkconfig: 2345 10 90  
# description: Start and Stop redis   

REDISPORT=6379
EXEC=/usr/local/bin/redis-server
CLIEXEC=/usr/local/bin/redis-server

PIDFILE=/var/run/redis_${REDISPORT}.pid
CONF="/etc/redis/redis.conf"

case "$1" in
    start)
        if [ -f $PIDFILE ]
        then
                echo "$PIDFILE exists, process is already running or crashed"
        else
                echo "Starting Redis server..."
                $EXEC $CONF &
        fi
        ;;
    stop)
        if [ ! -f $PIDFILE ]
        then
                echo "$PIDFILE does not exist, process is not running"
        else
                PID=$(cat $PIDFILE)
                echo "Stopping ..."
                $CLIEXEC -p $REDISPORT shutdown
                while [ -x /proc/${PID} ]
                do
                    echo "Waiting for Redis to shutdown ..."
                    sleep 1
                done
                echo "Redis stopped"
        fi
        ;;
    restart)
        "$0" stop
        sleep 3
        "$0" start
        ;;
    *)
        echo "Please use start or stop or restart as first argument"
        ;;
esac
```

设置权限

```
[root@localhost ~]# chmod 777 /etc/init.d/redis
 
```

设置开机启动

```
 chkconfig redis on
 
```

启动测试

```
 service start redis
```



