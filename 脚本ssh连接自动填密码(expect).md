# 脚本ssh连接自动填密码(expect)

Linux ssh下执行ssh命令远程登录其他机器，总是需要输入密码，如果人工去登录，输入密码那还可以，但是让程序自动化登录远程ssh服务器，并执行命令着就比较麻烦了。

Linux下有个程序是expect，它可以模拟键盘，输入文本。

## 1.expect安装

机器上一般是没有这个命令的，需要安装expect：

```
sudo apt-get install expect
yum install expect
```

## 2. expect脚本

经常看到一些脚本有会expect、spawn、send关键字，这几个关键字都是在expect程序里面使用的。

我们来看一个脚本，下面这个脚本ssh远程连接到节点100.2.12.213，并且cd到指定目录，然后在目录中新建名为“test”的文件夹：

```
#!/usr/bin/expect

set host 100.2.12.213
set user root
set timeout 2

spawn ssh $user@$host
expect "*password:*"
send "111111\r"
expect "*]#"
send "cd /home/caolch \r"
expect "*]#"
send "mkdir test \r"
expect "*]#"
send "exit\r"
expect eof
```

注意第一行使用的是#!/usr/bin/expect而不是普通的bash脚本那样。

- expect使用spawn命令来启动脚本和命令会话，这里启动的是ssh命令，这里的ssh命令将会以子进程的方式产生。
- send用来发送一个字符串，如上面的例子脚本中，我们调用send ”$password\r"就是把密码发送给SSH连接的服务器端指定端口。
- 与send相反，expect用来等待你所期望的字符串。比如expect "hello"。在expect后面跟的字符串中，你可以指定一个正则表达式。expect会一直等待下去，除非收到的字符串与预期的格式匹配，或者到了超期时间。
- set timeout 2 就是这是超期时间为2s，如果设置为-1则永远等待。

##  3 shell嵌套expect 命令行

 有时候写个expect脚本比较麻烦，直接只用命令行参数去执行命令，或者嵌套在shell脚本、python脚本中，这样可以减少expect脚本的数量。

 以下的shell脚本的for循环中调用expect命令，ssh连接多个计算机节点执行操作。

 

```
HOSTS="100.2.12.213 100.2.12.214"

for host in $HOSTS
do
        expect -c "
           set timeout 1;
           spawn ssh root@${host} -p 22  ;
           expect {
               yes/no { send \"yes\r\"; exp_continue }
               *assword* { send \"111111\r\" }
           } ;
           expect root@*   {send \" mkdir test1 \r\" }  ;
	    expect root@*   { send exit\r }  ;
           expect eof ;
       "
done
```

 

expect的参数-c后面是字符串，里面就相当于脚本里面的内容了。

- 用;分号隔开，可以在同一行里。
- 里面的"引号，使用\"来代替。
- 第13行的exit最好要有。退出ssh，这样程序不会阻塞。如果没有使用，在这个shell命令执行完，无法立刻输入字符。
- expect脚本必须以interact或expect eof结束，执行自动化任务通常expect eof就够了
- expect都是使用{}，且{  }使用时，前后需要留空格
- 例子使用花括号，表示使用一组并列表达式，只要其中一项符合，就会执行该项，类似switch