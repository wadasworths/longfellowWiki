### psql统计表大小
```
# 统计出不分区表的大小
select pg_relation_size('schema.table_name');

# 分区表大小新建函数统计
create fuction public.calc_partition_table_all(v_schemaname varchar, v_tablename varchar)

# 表大小byte->MB
pg_size_pretty();
```

### psql查看表结构，授权
```
\d 		# 查看表结构
\d+		# 查看表结构，及其分区结构
\dp     # 查看表授权
```

### psql查看lock表，语句以及释放
```
pg_lock()
pg_class()
pg_stat_activity()
pg_cancel_backend()
pg_terminate_backend()
```