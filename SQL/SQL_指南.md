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