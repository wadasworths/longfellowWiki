### 第四章：对象与类

类是构造对象的模板，由类创建construct对象的过程称之为类的实例化instance。

Java的所有代码，都在类的内部。Java是完全面向对象的。

#### 4.1.1

封装，是与类有关的一个重要概念。对象中的数据被称为是实例域。操作数据的过程称之为方法。

#### 4.2.0

对象变量和对象

#### 4.3.0

1.构造器与类同名
2.每个类可以有一个以上的构造器
3.构造器可以有0，或者多个参数
4.构造器没有返回值
5.构造器总是伴随着new操作执行

*构造器中不能定义与实例域同名的局部变量*

*一个对象变量并没有实际包含一个对象，仅仅是一个对象的引用*

-在每一个方法中，this表是隐式参数。

```java
class Employee(){
//类的实例域
private double salary;

	public void raiseSalary(double byPrecent){
		double raise = this.salary * byPrecent / 100；
		this.salary += raise;
	}
// salary表示raiseSalary方法所在类的实例域
// raise和 byPrecent表示的是方法的局部变量
}
```
-不能返回可变对象的访问器方法

```java
class Employee(){
	private Date hireDay;

	public Date gethireDay(){
		//return hireDay; //ERROR
		return (Date) hireDay.clone(); //
	}
	//如果需要返回一个可变数据域的拷贝，就需要使用clone()
}
```

#### 4.3.9 final 实例域

可以将实例域定义为final，构建对象时必须初始化这样的域。并且再后面的操作中，不能在对其修改。
对于可变类型的类不能用final修饰，例如：Date
```java
private final Date hireDay; //ERROR

private final int id;  //RIGHT 
```

#### 静态方法

什么时候需要设计一个静态方法？

1.需要访问一个类的静态实例域
2.一个方法不需要访问对象状态，其所需的参数都是通过显示参数提供：即不需要使用this的方法。


#### 重载

-值类型不同时需要重载
-参数数量不同时需要重载


#### 继承中super关键字

当子类和父类的方法相同时，子类的方法并不能访问父类方法的私有域。
```java
class Managet extends Employee{
	class getBonus(){
		double basebonus  = super.getralary()
		return rsalary += bonus
	}
}
```


### OOP三大特性

- 封装

- 继承

- 多态性

### 类与类之间的关系

- 依赖：uses-a，类与类之间的依赖关系称之为耦合。

- 聚合：has-a

- 继承：is-a

### 对象与对象变量

在Java中，使用构造器来构造新的实例。构造是一种特殊的方法，用来构造并初始化对象。

例如：标准Java库里有Date类：
```
//构造Date类的对象.
new Date();

//对象变量today，注意：today不是Date的对实例象，是一个对象变量
Date today = new Date();

System.out.println(today.to_String());

```

*解释：一个对象变量并没有实际包含一个对象，而仅仅是一个对象的引用*


### 更改器方法和访问器方法

get 方法查看并返回对象的状态

set和add 对对象的状态进行更改

### 类的访问权限


### 3.2简单数据类型

整数类型，java只支持有符号的整数类型 byte(8位)， short(16位)， int(32位)， long(64位)
浮点类型，float单精度32位，double双精度64位
字符类型，char
布尔类型，boolean


数组的声明

```java
int [] n_array = new int [10];
int n_array [] = new int [10];


# 二维数组
int [][] twoDArray = new int [4][5];
```


#### String

java中的String对象，java中的面向对象，但是基本类型不是对象。


#### 继承

### 5.1.2 多态性

程序中出现超类对象的任何地方都可以用子类对象置换
可以将一个子类对象，赋给超类变量。

```java
Employee e;
e = new Employee();
e = new Manager();   //Manager是Employee的子类
```
Java中，对象变量有多态性。

#### 泛型程序设计

泛型程序设计意味着编写的代码，可以被很多不同类型的对象所重用。



#### Java容器集合

ArrayList
LinkedList

Java语言中，所有链表都是双向连接的 doubly linked.

```
http://www.importnew.com/15980.html
https://www.ibm.com/developerworks/cn/java/j-perry-java-collections/index.html
https://www.ibm.com/developerworks/cn/java/
https://www.jianshu.com/p/63e76826e852
https://www.cnblogs.com/ysocean/p/6555373.html

```

接口 Iterator
接口 Collection


队列接口
```java
interface Queue<E> {
	void add(E element);
	int size();
}
```

Collection接口扩展了Iterable接口，因此，对于Java标准库中的任何集合都可以使用foreach
```java
for (String element : E) {
	//do something with element
}
```

1.迭代器 Iterator

```java
interface Iterator<E>{
	E next();
	boolean hasNext();
	void remove();
}
```

通过反复调用next方法，来访问迭代器中每一个元素。


