#
```sh
javac -classpath /usr/hadoop/share/hadoop/common/hadoop-common-2.7.5.jar:/usr/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.5.jar:/home/longfellow/commons-cli-1.4/commons-cli-1.4.jar -d classes/ src/*.java
```

打包jar包
```sh
jar -cvf wordcount.jar -C classes/ .
```


### gsod数据来源

```
for i in {1949..2014}
do
cd $dir/gsod
wget ftp://ftp.ncdc.noaa.gov/pub/data/gsod/$i/gsod_$i.tar
done
```