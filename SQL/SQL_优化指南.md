### SQL优化原则

[博客来源](https://blog.csdn.net/wuhuagu_wuhuaguo/article/details/72875054)

1.对查询优化，要尽量避免全表扫描，首先应考虑在 where 及 order by 涉及的列上建立索引。

2.避免在 where 子句中对字段进行 null 值判断，否则将导致引擎放弃使用索引而进行全表扫描。
```sql
select id from t where t.num is null
```
最好不要给数据库留NULL，尽可能的使用 NOT NULL填充数据库。
可以在num上设置默认值0，确保表中num列没有null值。

3.避免在 where 子句中使用 != 或 <> 操作符，否则将引擎放弃使用索引而进行全表扫描。

4.避免再 where 子句中使用or来连接条件，如果一个字段有索引，另外一个字段没索引将导致引擎放弃使用索引全表扫描。
```sql
select id from t where num=10 or Name='admin';
```
使用union all来替换
```sql
select id from t where num = 10 union allselect id from t where Name = 'admin';
```

5.in和not in 慎用，连续的数值用 between 或者exists代替in
```sql
# 错误的写法
select id from t where num in (1, 2, 3);

# 用between代替
select id from t where num between 1 and 3;
```