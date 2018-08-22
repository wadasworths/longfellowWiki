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


### python正则表达式
```
re 模块

# 精确匹配

\d 匹配数字
\w 匹配字母或者数字

'00\d' '007' not '00A'
'\d\d\d' '010'
'\w\w\d' 'py3'


要匹配变长的字符，在正则表达式中，用 * 表示任意个字符（包括0个），用 + 表示至少一个字符，用 ? 表示0个或1个字符，用 {n} 表示n个字符，用 {n,m} 表示n-m个字符：
来看一个复杂的例子： \d{3}\s+\d{3,8} 。
我们来从左到右解读一下：
1. \d{3} 表示匹配3个数字，例如 '010' ；
2. \s 可以匹配一个空格（也包括Tab等空白符），所以 \s+ 表示至少有一个空格，例如匹配 ' ' ， ' ' 等；
3. \d{3,8} 表示3-8个数字，例如 '1234567' 。
综合起来，上面的正则表达式可以匹配以任意个空格隔开的带区号的电话号码。
如果要匹配 '010-12345' 这样的号码呢？由于 '-' 是特殊字符，在正则表达式中，要用 '\' 转义，所以，上面的正则是 \d{3}\-\d{3,8} 。
但是，仍然无法匹配 '010 - 12345' ，因为带有空格。所以我们需要更复杂的匹配方式。
强化篇
要做更精确地匹配，可以用 [] 表示范围，比如：
• [0-9a-zA-Z\_] 可以匹配一个数字、字母或者下划线；
• [0-9a-zA-Z\_]+ 可以匹配至少由一个数字、字母或者下划线组成的字符串，比如 'a100' ， '0_Z' ， 'Py3000' 等等；
• [a-zA-Z\_][0-9a-zA-Z\_]* 可以匹配由字母或下划线开头，后接任意个由一个数字、字母或者下划线组成的字符串，也就是Python合法的变量；
• [a-zA-Z\_][0-9a-zA-Z\_]{0, 19} 更精确地限制了变量的长度是1-20个字符（前面1个字符+后面最多19个字符）。
A|B 可以匹配A或B，所以 (P|p)ython 可以匹配 'Python' 或者 'python' 。
^ 表示行的开头， ^\d 表示必须以数字开头。
$ 表示行的结束， \d$ 表示必须以数字结束。
你可能注意到了， py 也可以匹配 'python' ，但是加上 ^py$ 就变成了整行匹配，就只能匹配 'py' 了。
```


### copy deepcopy
```
类型是对象的，不是变量的

对象有可变：list，set，字典
不可变：数值，字符串，元组

对于不可变的对象，没有区别

对于例如list
deepcopy:深复制，完全复制，和原来的对象没什么关系，所以改变原有被复制对象不会对已经复制出来的新对象产生影响。

copy:浅复制，第一种情况：复制的 对象中无 复杂 子对象，原来值的改变并不会影响浅复制的值，同时浅复制的值改变也并不会影响原来的值。原来值的id值与浅复制原来的值不同。

第二种情况：复制的对象中有 复杂 子对象 （例如列表中的一个子元素是一个列表），如果不改变其中复杂子对象，浅复制的值改变并不会影响原来的值。 但是改变原来的值 中的复杂子对象的值  会影响浅复制的值

等于复制，相当于一个指针，一变都变


# 测试

a = [1, 2, 3, 4, ['a', 'b']]
b = a
c = copy.copy(a)
d = copy.deepcopy(a)


id(a) == id(b) True
id(a) == id(c) False
id(a) == id(d) False

#

id(a[0]) == id(c[0]) True  # copy   list元素内存地址相同

id(a[0]) == id(d[0]) Flase  # deepcopy   

```

### python中常见的类型
```
# list 列表，
# dict 字典
# set  集合
# tuple 元组
 



字典的操作，更新update   clear   pop删除 字典popitem()方法
```


### python位移操作符
```
2<<10 # << 左移 10位  10 -> 100000000000  
输出2048

10>>2 # >> 右移 2位    1010 -> 10 
输出 2

2048 >> 10 右移 10位 
输出 2


### 字符串填充

n='4' # string

n.zfill(3)
```

### python小技巧
```
# 获取脚本的运行时间，或者函数

import cProfile

cProfile.run('foo()')

# 写一个装饰器，用来测算函数的执行时间
```

### python装饰器
```
def deco(foo):
	def wrapper(*args, **kwargs):
		# do something
		foo(*args, **kwargs)

		# do something
	return wrapper


@deco
def foo(*args, **kwargs):
	# do something


if __name__ == 'main':
	

# 可以传参也可以不传参

# 多个装饰器的解析
```

### Sequence type --list tuples range object

python中三种基本的Sequence类型  lists, tuples, and range objects

```python
x in s
x not in s

```