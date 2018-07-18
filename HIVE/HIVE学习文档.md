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
set mapreduce.input
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

### sqoop并发问题

