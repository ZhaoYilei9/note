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

##### ssh-keygen -t rsa -C "zyl17763238627@gmail.com" 

### 测试SSH Key登录

ssh -T git@github.com 

### 添加远程仓库
git remote add origin 仓库地址

### git pull 的可能结果：

​		`Agent` admitted failure to sign using the key. 						debug1: No more authentication methods to try. Permission d			enied (publickey). 

上面的错误在某些Linux发行版（比如我的Fedora 17）是一个已知的错误， 可以忽略。 然后会看到打印出公钥的指纹，请确认此指纹和你公钥的一致，然后输入"yes"确认 

​	" Hi your_name! You've successfully authenticated, but GitHub does not provide shell access." 
#貌似要以ssh方式克隆才会起作用

第一次上传代码时出现以下错误：

D:\java_projects\test>git push origin master
To https://git.oschina.net/qingke3/tom.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://git.oschina.net/qingke3/tom.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
1
2
3
4
5
6
7
8
原因：远程代码库有某些文件本地代码库中不存在，会有冲突的隐患。 
解决方法：需要先执行git pull的操作，把远程代码先拿下来，如下：

D:\java_projects\test>git pull origin master
From https://git.oschina.net/qingke3/tom
 * branch            master     -> FETCH_HEAD
fatal: refusing to merge unrelated histories
1
2
3
4
这时还是有错误，这是因为git拒绝合并无关的历史纪录，解决方法是在git pull时加上–allow-unrelated-histories，如下：

git pull origin master --allow-unrelated-histories
1
最后在push即可






