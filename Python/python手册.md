### 虚拟环境使用
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

### Built in Types (内置类型)

The principal built-in types are numerics, sequences, mappings, classes, instances and exceptions.

1.真值检测
 if和while的判断条件里
2.bool表达式，or,and,not
3.大小比较
 < ，> ，<= ，>= ，== ，!= ，is ，is not ，in ，not in
4.数值类型
 int float complex



### 字符处理
```
"hello world".title() # 首字母大写
```


### ORM对象映射关系
```
https://www.cnblogs.com/mrchige/p/6389588.html

ruby中的ActiveRecord
python中的SQLAlchemy
```