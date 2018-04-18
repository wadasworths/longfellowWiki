###虚拟环境使用
```
# windows使用
virtualenv D:\python

# 指定版本
virtualenv D:\python python=python3.5

# virtualenv -p 解释器路径 虚拟环境名称
virtualenv -p C:\python27/python.exe python2

virtualenv -p 解释器路径 虚拟环境名称 --no-site-packages
不安装系统python安装包的安装环境
```