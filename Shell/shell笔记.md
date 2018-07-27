### shell按行处理文件

```bash
while read line
do
    echo ${line}
done < text.txt
```

### awk处理字符串

```bash
str='a b c d'

echo ${str} | awk ' ' '{print $1}'
a
echo ${str} | awk ' ' '{print $2}'
b
echo ${str} | awk ' ' '{print NF}'
4
```

### 数组操作

```bash
length=${#array[@]}

$1=${array[0]}
```

### 执行在文件中的shell
```bash
#eval
eval grep connect ${conf_file}
```

### shell正则表达式
```
"^[A-Za-z]+$.^[A-Za-z0-9]+$"
```

### shell定时器crontab
```
m h dom mon dow command

m:分钟，0-59
h:小时，0-23
dom:日期，1-31
mon:月份，1-12
dow:星期，0-6，0为星期天
command:命令

crontab使用指南：脚本路径，环境变量。
例如，source ~/.bashrc
或者调用python脚本，/usr/local/bin/python2.7


* * * * * php /path/to/your/cron.php
5个星号分别代表定时指定每分、小时、日、月、周。

* 19 * * * php /var/www/cron/crontab.php
讲第二个参数h填写为19，则表示每天的下午7点执行crontab.php。

* * * * * php /path/to/your/cron.php         
每隔一分钟执行一次任务  

0 * * * * php /path/to/your/cron.php                 
每小时的0点执行一次任务，比如6:00，10:00  

6,10 * 2 * * php /path/to/your/cron.php           
每个月2号，每小时的6分和10分执行一次任务  

*/3,*/5 * * * * php /path/to/your/cron.php        
每隔3分钟或5分钟执行一次任务，比如10:03，10:05，10:06



*（星号）：表示任意值，在相应位置填写*，可以代表任意执行。比如h为*，则为任意的小时
,（逗号）：表示一个部分填写多个值，比如在m位置填写1,5代表1分钟或5分钟时候
/（斜杠）：表示每隔多久，比如在h部分填写*/2表示每隔2个小时，*/3表示每隔3个小时，
*/1和*无区别，所以可以省略。这里可以想想，*/2表示能被2整除的时间就好理解了
```

### shell配置文件连接数据库
```
# 配置文件的写法
$ cat mysql_conn.cfg

[client]
user=username
password=password
host=localhost
port=3306
database=test

shell脚本写法
mysql_connf='mysql_connf.cfg'
MYSQL_CONN="mysql --default-extra-file=${mysql_connf}"

${MYSQL_CONN} -N -e "show tables;"
```

### shell中调用psql的写法
```
export password
# 命令行
psql -h localhost -U username -p 5433 -d gptest -c ""
# 文件执行sql
psql -h localhost -U username -p 5433 -d gptest -c ""
```/

### 互信服务器文件传输
```
scp -r file etl@sdw60:/homo/copy
```

### $
```
$0 这个程式的执行名字
$n 这个程式的第n个参数值，n=1..9
$* 这个程式的所有参数,此选项参数可超过9个。
$# 这个程式的参数个数
$$ 这个程式的PID(脚本运行的当前进程ID号)
$! 执行上一个背景指令的PID(后台运行的最后一个进程的进程ID号)
$? 执行上一个指令的返回值 (显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误)
$- 显示shell使用的当前选项，与set命令功能相同
$@ 跟$*类似，但是可以当作数组用
```


### 脚本中验证参数
```
echo "$0 $@"  # 输出脚本名字  参数

# 判断脚本参数
if [ $# -lt 1 ] || [ $# -gt 3 ]; then
   echo "Usage: $0 [options] <data-dir> [<log-dir> [<mfcc-dir>] ]";
   echo "e.g.: $0 data/train exp/make_mfcc/train mfcc"
   echo "Note: <log-dir> defaults to <data-dir>/log, and <mfccdir> defaults to <data-dir>/data"
   echo "Options: "
   echo "  --mfcc-config <config-file>                      # config passed to compute-mfcc-feats "
   echo "  --nj <nj>                                        # number of parallel jobs"
   echo "  --cmd (utils/run.pl|utils/queue.pl <queue opts>) # how to run jobs."
   echo "  --write-utt2num-frames <true|false>     # If true, write utt2num_frames file."
   exit 1;
fi
```

### shell文件操作
```
-e filename 如果 filename存在，则为真 
-d filename 如果 filename为目录，则为真 
-f filename 如果 filename为常规文件，则为真 
-L filename 如果 filename为符号链接，则为真 
-r filename 如果 filename可读，则为真 
-w filename 如果 filename可写，则为真 
-x filename 如果 filename可执行，则为真 
-s filename 如果文件长度不为0，则为真 
-h filename 如果文件是软链接，则为真 
filename1 -nt filename2 如果 filename1比 filename2新，则为真。 
filename1 -ot filename2 如果 filename1比 filename2旧，则为真。 
```


### 并发执行 

```
#!/bin/bash
# Step1 创建有名管道
[ -e ./fd1 ] || mkfifo ./fd1

# 创建文件描述符，以可读（<）可写（>）的方式关联管道文件，这时候文件描述符3就有了有名管道文件的所有特性
exec 3<> ./fd1   

# 关联后的文件描述符拥有管道文件的所有特性,所以这时候管道文件可以删除，我们留下文件描述符来用就可以了
rm -rf ./fd1                    

# Step2 创建令牌 
for i in `seq 1 2`;
do
    # echo 每次输出一个换行符,也就是一个令牌
    echo >&3                   
done

# Step3 拿出令牌，进行并发操作
for line in `seq 1 10`;
do
    read -u3                    # read 命令每次读取一行，也就是拿到一个令牌   
    {
        echo $line 
        echo >&3                # 执行完一条命令会将令牌放回管道
    }&
done

wait

exec 3<&-                       # 关闭文件描述符的读
exec 3>&-                       # 关闭文件描述符的写
```

### cat显示指定行
```
#从第3000行开始，显示1000行。即显示3000~3999行
cat filename | tail -n +3000 | head -n 1000

#显示1000行到3000行
cat filename| head -n 3000 | tail -n +1000
```



### 大小写转换
```
echo 'stmp' | tr ['a-z'] [A-Z]
```

### Linux最大进程数，以及open  files 修改
```
#查看 当前用户限制 进程文件限制

ulimit -a

cat /etc/security/limits.d/90-nproc.conf  -> 修改进程数

cat /etc/security/limits.conf 

最后添加
* sort nofile 65535
* hard nofile 65535
```


### 文件夹授权
```
chown etl:etl etl_job/
chown etl:root etl_job/
```

### rsync+inotify实现服务器之间文件实时同步

```

https://www.jb51.net/article/57011.htm
```