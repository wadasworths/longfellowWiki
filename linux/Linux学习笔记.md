### nc

```
yum install nc

# nc命令通信
nc -lk 7777
nc hostname 777
```

### -r
```
# 文件夹递归处理
cp -r [源文件] [目标文件目录]
```

### grep 
```
ps -ef | grep *** | grep -v grep

#不输出查询grep的进程号
```

### 创建用户
```
useradd username
passwd username
```

### chmod
权限管理

### 进程的R S D T Z X
```
https://blog.csdn.net/nilxin/article/details/7437671
```


### linux用户管理
```sh
useradd -d /home/longfellow -m -s /bin/bash longfellow
gpasswd –a longfellow sudo
passwd longfellow
# https://blog.csdn.net/baidu_35679960/article/details/78752591
```

###