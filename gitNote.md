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

git pull origin master --allow-unrelated-histories







