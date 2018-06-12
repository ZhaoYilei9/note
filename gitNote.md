# git

### 运行前的配置：

#### $ git config --global user.name "ZhaoYilei9"



#### $ git config --global user.email zyl17763238627@gmail.com



### 检查配置信息:


####$ git config --list

### 初始化仓库：

#### $ git init



### 克隆现有的仓库

#### $ git clone https://github.com/libgit2/libgit2 mylibgit##自定义仓库名字



### 记录每次更新到仓库

#### 工作目录下的每一个文件都不外乎这两种状态：已跟踪或未跟踪 

###检查当前文件状态
####克隆仓库后立即使用此命令
$ git status
On branch master
nothing to commit, working directory clean

### github的ssh key配置

#### 生成SSH Key

##### ssh-keygen -t rsa -C "your_email@example.com" 

### 测试SSH Key登录

ssh -T git@github.com 

可能结果：

​		`Agent` admitted failure to sign using the key. 						debug1: No more authentication methods to try. Permission d			enied (publickey). 

上面的错误在某些Linux发行版（比如我的Fedora 17）是一个已知的错误， 可以忽略。 然后会看到打印出公钥的指纹，请确认此指纹和你公钥的一致，然后输入"yes"确认 

​	" Hi your_name! You've successfully authenticated, but GitHub does not provide shell access." 
#貌似要以ssh方式克隆才会起作用





