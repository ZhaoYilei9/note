### shell脚本自动输入密码

```
#!/usr/bin/expect                  
set timeout 5                      
spawn ssh root@192.168.0.100 
expect "*password*"                 
send "123\r"                
interact 
```

