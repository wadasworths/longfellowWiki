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

[PostgreSQL](https://www.postgresql.org/docs/10/static/index.html)

```
https://yq.aliyun.com/ask/184?order=ctime

https://blog.csdn.net/luojinbai/article/details/45476627
```
pg可以加锁的对象：
```c
        LOCKTAG_RELATION,                       /* whole relation */
        /* ID info for a relation is DB OID + REL OID; DB OID = 0 if shared */
        LOCKTAG_RELATION_EXTEND,        /* the right to extend a relation */
        /* same ID info as RELATION */
        LOCKTAG_PAGE,                           /* one page of a relation */
        /* ID info for a page is RELATION info + BlockNumber */
        LOCKTAG_TUPLE,                          /* one physical tuple */
        /* ID info for a tuple is PAGE info + OffsetNumber */
        LOCKTAG_TRANSACTION,            /* transaction (for waiting for xact done) */
        /* ID info for a transaction is its TransactionId */
        LOCKTAG_VIRTUALTRANSACTION, /* virtual transaction (ditto) */
        /* ID info for a virtual transaction is its VirtualTransactionId */
        LOCKTAG_SPECULATIVE_TOKEN,      /* speculative insertion Xid and token */
        /* ID info for a transaction is its TransactionId */
        LOCKTAG_OBJECT,                         /* non-relation database object */
        /* ID info for an object is DB OID + CLASS OID + OBJECT OID + SUBID */

        /*
         * Note: object ID has same representation as in pg_depend and
         * pg_description, but notice that we are constraining SUBID to 16 bits.
         * Also, we use DB OID = 0 for shared objects such as tablespaces.
         */
        LOCKTAG_USERLOCK,                       /* reserved for old contrib/userlock code */
        LOCKTAG_ADVISORY                        /* advisory user locks */
```

pg锁模式：
```c++
/* NoLock is not a lock mode, but a flag value meaning "don't get a lock" */
#define NoLock                                  0

#define AccessShareLock             1   /* SELECT */
#define RowShareLock                2   /* SELECT FOR UPDATE/FOR SHARE */
#define RowExclusiveLock            3   /* INSERT, UPDATE, DELETE */
#define ShareUpdateExclusiveLock    4   /* VACUUM (non-FULL),ANALYZE, CREATE * INDEX CONCURRENTLY */
#define ShareLock                   5   /* CREATE INDEX (WITHOUT CONCURRENTLY) */
#define ShareRowExclusiveLock       6   /* like EXCLUSIVE MODE, but allows ROW * SHARE */
#define ExclusiveLock               7   /* blocks ROW SHARE/SELECT...FOR * UPDATE */
#define AccessExclusiveLock         8   /* ALTER TABLE, DROP TABLE, VACUUM * FULL, and unqualified LOCK TABLE */
```

锁模式之间的关系
```
AccessShareLock 和 AccessExclusiveLock 冲突：
	查询时，不能alter table， drop，truncate vacuum等

RowShareLock 和 AccessExclusiveLock ExclusiveLock 冲突：
	查询某一行记录，行锁

“Row exclusive” 与 “Share,Shared roexclusive,Exclusive,Access exclusive”模式冲突;
	“Update,Delete,Insert”命令会在目标表上获得这种类型的锁，并且在其它被引用的表上加上”Access shared”锁,一般地，更改表数据的命令都将在这张表上获得”Row exclusive”锁。

“Share update exclusive,Share,Share row ,exclusive,exclusive,Access exclusive”模式冲突，这种模式保护一张表不被并发的模式更改和VACUUM;
	“Vacuum(without full), Analyze ”和 “Create index concurrently”命令会获得这种类型锁。

Share与“Row exclusive,Shared update exclusive,Share row exclusive ,Exclusive,Access exclusive”锁模式冲突,这种模式保护一张表数据不被并发的更改;
	“Create index”命令会获得这种锁模式。

SHARE ROW EXCLUSIVE与“Row exclusive,Share update exclusive,Shared,Shared row exclusive,Exclusive,Access Exclusive”锁模式冲突;
	任何Postgresql 命令不会自动获得这种锁

EXCLUSIVE与” ROW SHARE, ROW EXCLUSIVE, SHARE UPDATE EXCLUSIVE, SHARE, SHARE ROW EXCLUSIVE, EXCLUSIVE, ACCESS EXCLUSIVE”模式冲突,这种索模式仅能与Access Share 模式并发,换句话说，只有读操作可以和持有”EXCLUSIVE”锁的事务并行；
	任何Postgresql 命令不会自动获得这种类型的锁；

ACCESS EXCLUSIVE
　　与所有模式锁冲突(ACCESS SHARE, ROW SHARE, ROW EXCLUSIVE, SHARE UPDATE EXCLUSIVE, SHARE, SHARE ROW EXCLUSIVE, EXCLUSIVE, and ACCESS EXCLUSIVE),这种模式保证了当前只有一个事务访问这张表;
```

锁模式和对应数据库操作
```
锁类型	         		对应的数据库操作
ACCESS SHARE	 		select
ROW SHARE		 		select for update, select for share
ROW EXCLUSIVE	 		update,delete,insert
SHARE UPDATE EXCLUSIVE	vacuum(without full),analyze,create index concurrently
SHARE					create index
SHARE ROW EXCLUSIVE		任何Postgresql命令不会自动获得这种锁
EXCLUSIVE				任何Postgresql命令不会自动获得这种类型的锁
ACCESS EXCLUSIVE		alter table,drop table,truncate,reindex,cluster,vacuum full
```