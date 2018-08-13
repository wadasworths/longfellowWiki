
### Pythonic python之禅
```
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