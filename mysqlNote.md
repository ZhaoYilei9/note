## mysql

### 设置权限

GRANT ALL PRIVILEGES ON *.* TO ['root'@'%'] IDENTIFIED BY '123' WITH GRANT OPTION; flush privileges; 

### 设置密码 

SET PASSWORD FOR ['root'@'localhost'](mailto:'root'@'localhost') = PASSWORD('1234'); 

