## mysql

### 设置权限

GRANT ALL PRIVILEGES ON *.* TO ['root'@'%'](mailto:'root'@'%') IDENTIFIED BY 'admin123' WITH GRANT OPTION; flush privileges; 

### 设置密码 

SET PASSWORD FOR ['root'@'localhost'](mailto:'root'@'localhost') = PASSWORD('1234'); 

