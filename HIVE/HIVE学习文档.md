### 基本操作
```
show databases;
show tables; 
show create table;
```

### 分区表

##### 动态分区

```
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.execution.engine=mr;
set mapreduce.input.fileinputformat.input.dir.recursive=true

```

```
insert overwrite table table_name (part_name)

select bb.*, if(aa.city_name is not null, aa.city_name, 'other') etl_city

from (select a.city_name,a.city_code from ref.etl_job_city_info_dim a 
	   where a.city_type='${city_type}') aa

right join ids.ti_${table_name} bb 

on bb.${part_column}=aa.city.code;
```

### TEZ引擎并发问题
```
设置mapreduce引擎
set hive.execution.engine=mr;
```

### sqoop并发问题

```
常见错误一：
ulimit -a 查看用户的最大openfiles 和 max processes 这种错误一般会出现fork报错

并发问题二：
sqoop不能并发执行，需要在cd $JAVA_HOME/jre/lib/security/ 找到java.security文件
修改其中的：
securerandom.source=file:/dev/random
securerandom.source=file:/dev/../dev/urandom
```

### HIVE外部表递归加载文件夹
```
set mapreduce.input.fileinputformat.input.dir.recursive=true
```

### HIVE文件格式
```
https://blog.csdn.net/hereiskxm/article/details/42171325
https://www.cnblogs.com/tlnshuju/p/7255509.html
```

ORCFILE
SEQUENCEFILE
RCFFILE
TEXTFILE 为默认格式，建表时不指定默认为这个格式，导入数据时会直接把数据文件拷贝到hdfs上不进行处理；

```sql
# HIVE外部表
CREATE EXTERNAL TABLE 
  IF NOT EXISTS table_name (column type) 
STORED AS TEXTFILE location '/user/hive/warehouse/';

# HIVE内部表

```