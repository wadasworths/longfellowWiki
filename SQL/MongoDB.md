### MongoDB安装
```
vim /etc/yum.repos.d/mongodb-org-4.0.repo 

[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc


yum update 


```

### 登陆身份验证
```
2018-08-28T14:58:39.982+0800 E QUERY    [js] Error: listDatabases failed:{
	"ok" : 0,
	"errmsg" : "command listDatabases requires authentication",
	"code" : 13,
	"codeName" : "Unauthorized"
} :
_getErrorWithCode@src/mongo/shell/utils.js:25:13
Mongo.prototype.getDBs@src/mongo/shell/mongo.js:67:1
shellHelper.show@src/mongo/shell/utils.js:876:19
shellHelper@src/mongo/shell/utils.js:766:15
@(shellhelp2):1:1
```

需要执行:
```sql
db.auth("usename","passwd")
```

### MongoDB角色用户管理

数据库用户角色：read，readWrite
数据库管理角色：dbAdmin，dbOwner，userAdmin

```sql
# 创建角色
use dbname #首先
db.createUser()

```


### pymongo 
https://blog.csdn.net/weisongming/article/details/71425302

```python
from pymongo import MongoClient
import datetime

myclient = MongoClient("mongodb://localhost:27017/")
myclient.dota2
db.authenticate("dota", "dota#12")

post = {"author": "Mike", "text": "My first blog post!", "tags": ["mongodb", "python", "pymongo"], "date": datetime.datetime.utcnow()}

posts = db.posts
post_id = posts.insert_one(post).inserted_id

# post_id
# ObjectId('5b850b7ac9afbb3632dc5593')

```


### MongoDB

```sql
use DATABASE_NAME   # 创建数据库

db.mycollection.insert({"name":"yiibai tutorials"})    # 在当前数据库中插入一条集合

show dbs;    # 查看所有数据库

db.dropDatabase()    # 删除当前数据库

db.createCollection(name, options) 		# name 是要创建的集合的名称。 options(可选)是一个文档

db.mycollection.drop() 		# 删除mycollection集合

# MongoDB中的or and

db.mycollection.find(
	{$and : [
		{key1: value1},
		{key2: value2}
		]
	}
)


db.mycollection.find(
	{$or : [
		{key1: value1},
		{key2: value2}
		]
	}
)
```