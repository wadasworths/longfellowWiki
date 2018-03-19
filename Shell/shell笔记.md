###shell按行处理文件

```bash
while read line
do
    echo ${line}
done < text.txt
```

###awk处理字符串

```bash
str='a b c d'

echo ${str} | awk ' ' '{print $1}'
a
echo ${str} | awk ' ' '{print $2}'
b
echo ${str} | awk ' ' '{print NF}'
4
```

###数组操作

```bash
length=${#array[@]}

$1=${array[0]}
```

###执行在文件中的shell
```bash
#eval
eval grep connect ${conf_file}
```

###shell正则表达式
```
"^[A-Za-z]+$.^[A-Za-z0-9]+$"
```

###shell定时器crontab
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

