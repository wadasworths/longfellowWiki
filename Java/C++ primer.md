### 数组
```
//声明与初始化
int yams[3];
yams[0] = 1;
yams[1] = 2;
yams[2] = 3;


//初始化列表
int yamscosts[3] = {1, 2, 3};

```

### 处理数据

- C++ 内置整型：unsigned long, long, unsigned int, int, unsigned short, short, char, unsigned char, bool, unsigned bool

- C++ 内置浮点型：float, double, long double;

- C++ 11新增类型，long long, unsigned long long。

- const限定符来创建符号常量。

- 类型分类：
1.基本类型：整型，浮点型;
2.复合类型：数组，字符串，指针，结构体.

### 数组和字符串

**存储多个同类型的值***

声明一个数组：
typeName arrayName[arraySize];

arraySize不能是变量，变量在程序运行时设置，可以使用new运算符。

列表初始化禁止缩窄转化。
```
long plifs[] = {25, 92, 3.0} 3.0浮点型，-》long整形，是缩窄操作
char slifs[4] {'h', 'i', 1122011, '\0'} 1122011超出char的取值范围。
char tlifs[4] {}
```