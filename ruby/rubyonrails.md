### ruby on rails安装

建议在非root用户下操作，建立自己的开发账号

#### 安装rvm
```
# 安装rvm需要官方提供的key
```

#### rvm管理ruby rails
```
source ~/.rvm/scripts/rvm # 安装rvm 让rvm生效

rvm install 2.5.1 # 安装ruby 2.5.1

rvm use 2.5.1 --default # 指定默认ruby版本 

# 上述命令打开新的终端可能会ruby版本还是系统默认，需要修改~/.bashrc
```