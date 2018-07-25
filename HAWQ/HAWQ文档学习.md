### HAWQ文档

#### 数据导出导入

HAWQ支持通过外部表(external tables)进行高性能并行数据导出导入。
小规模数据使用Copy命令。

从外部表导数至内部表：
```
# 方式一
insert into table select * from ext_table;

# 方式二
create table as select * from ext_table;
```

COPY命令可以把单个文件加载到HAWQ，也可以从HAWQ导出数据到文件，是串行的。

#### HDFS外部表导入数据
```
CREATE EXTERNAL TABLE table_name (column_name)
location ('pxf://${HDFS文件路径}')
FORMAT 'CSV/TEXT/...' (delimiter E'^A' null E'\\N' escape E'OFF') ENCODING 'UTF8';
```

#### COPY导入导出数据
