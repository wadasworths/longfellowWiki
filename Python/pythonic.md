
### Pythonic python之禅
```python
# 隐藏的空列表，list式布尔类型

a = []

if not a:
	print("List a is empty!")


# 变量交换

a, b = b, a

# 索引

num_list = [1, 4, 9]

for k, v in enumerate(num_list):
	print(k, '-->', v)

# 打开文件

with open('filename') as f:
	date = f.read()

# 使用with，Python将自动管理文件流的打开与关闭，无需手动操作。

```

#### List可修改对象，
```


```

#### 字典按key value排序
```python
x = {1: 2, 3: 4, 4:3, 2:1, 0:0}

import operator

# 按value排序
sorted_x = sorted(x.items(), key=operator.itemgetter(1))

# 按key排序
sorted_x = sorted(x.items(), key=lambda x: x[0])

sorted(x.items(), key=lambda x: x[0])
sorted(x.items(), key=lambda x: x[1])
```
