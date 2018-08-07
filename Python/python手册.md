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

<<<<<<< HEAD
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
=======

>>>>>>> 1c6f1c98ef67cba5e67c2d4b22a22542b0820eb3

### 字典推导式 && 列表推导式
```
[x*x for in range(20) if x%2 ==0]  # 列表推导式


dicts={"a":1, "b":2, "c":3, "d":4}
{v:k for k,v in dicts.items()} #字典推导式

# {1: 'a', 2: 'b', 3: 'c', 4: 'd'}
```

### python中的自省
```
# 自省就是面向对象的语言所写的程序在运行时,所能知道对象的类型.
type(),dir(),getattr(),hasattr(),isinstance().

# type()与isinstance() 区别
type() 不会认为子类是一种父类类型，不考虑继承关系。
isinstance() 会认为子类是一种父类类型，考虑继承关系。

如果要判断两个类型是否相同推荐使用 isinstance()。
```


### 统计文件行数
```
# 如果要统计文件的行数，可以这样写：
count = len(open(filepath, 'r').readlines())
# 这种方法简单，但是可能比较慢，当文件比较大时甚至不能工作。

# 可以利用enumerate()：
count = 0
for index, line in enumerate(open(filepath,'r'))： 
    count += 1
```