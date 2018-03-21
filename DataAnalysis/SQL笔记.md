###psql统计表大小
```
# 统计出不分区表的大小
select pg_relation_size('schema.table_name');

# 分区表大小新建函数统计
create fuction public.cal

# 表大小byte->MB
pg_size_pretty();
```