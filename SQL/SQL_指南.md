### mysql判断某条记录是否存在的方法

```
select count(1) from table_name where condition;

#受表大小影响，效率问题

select 1 from table_name where codition limit 1;

###

select * from table_name where codition limit 1;

###

select exists (select * from table_name from codition);

# 只能判断记录是否存在，子查询select * 在执行时会被忽略掉。

### 

其他程序判断。
```


### mysqldump  pg_dump导出表结构及表数据
```
pg_dump -h mdw2 -U gpadmin -p 5433 -d pgods -s -t table_name > table_name.sql

```

### JDBC fetch以及betch 
```
http://blog.itpub.net/29254281/viewspace-1063033/
```

### MYSQL
```
show variables like 'character%'; 
select version();
set character_set_results=utf8;

```


### ORACLE 执行计划
```
https://www.cnblogs.com/Dreamer-1/p/6076440.html

MYSQL
https://blog.csdn.net/wuseyukui/article/details/71512793
https://blog.csdn.net/heng_yan/article/details/78324176
```


### PSQL
```
psql: FATAL: the database system is starting up
```


### 数据库关系表设计
```
一对多的关系，一个部门有多个员工，一个员工所属一个部门
员工表添加外键标记，对应部门表的主键

多对多的关系，一个学生可以选N门课程，一门课程也可以被N个学生选择
利用两张表的主键 创建中间表

一对一的关系，一个人只有一个身份证号码，一个身份证号码对应一个人
一张表可以解决
```


### PostgreSQL锁浅析
```
https://blog.csdn.net/luojinbai/article/details/45476627
```
