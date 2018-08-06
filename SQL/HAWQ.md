## 存在问题

HAWQ锁表删除

```sql
select pg_cancel_backend(pid int);
select pg_terminate_backend(pid int);
```

存在的问题，在```pg_locks```中锁表，但是没有进程号。解决办法，重启HAWQ。

HAWQ执行语句查询：
```
select * from pg_stat_activity;
```

查看是否锁表

```
select a.relname fron pg_class a ,pg_locks b where a.oid=b.relation;
```

