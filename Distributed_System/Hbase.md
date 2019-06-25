#### Hbase中CloumnFamily设计

HBase本身的设计目标是 支持稀疏表，而 稀疏表通常会有很多列，但是每一行有值的列又比较少。
如果不使用Column Family的概念，那么有两种设计方案：
1.把所有列的数据放在一个文件中（也就是传统的按行存储）。那么当我们想要访问少数几个列的数据时，需要遍历每一行，读取整个表的数据，这样子是很低效的。
2.把每个列的数据单独分开存在一个文件中（按列存储）。那么当我们想要访问少数几个列的数据时，只需要读取对应的文件，不用读取整个表的数据，读取效率很高。然而，由于稀疏表通常会有很多列，这会导致文件数量特别多，这本身会影响文件系统的效率。
 
而Column Family的提出就是为了在上面两种方案中做一个折中。HBase中 将一个Column Family中的列存在一起，而不同Column Family的数据则分开。
由于在HBase中Column Family的数量通常很小，同时HBase建议把经常一起访问的比较类似的列放在同一个Column Family中，这样就可以在访问少数几个列时，只读取尽量少的数据。

优化：


   因为一直在做hbase的应用层面的开发，所以体会的比较深的一点是hbase的表结构设计会对系统的性能以及开销上造成很大的区别，本篇文章先按照hbase表中的rowkey、columnfamily、column、timestamp几个方面进行一些分析。最后结合分析如何设计一种适合应用的高效表结构。

      1、表的属性

(1)最大版本数：通常是3，如果对于更新比较频繁的应用完全可以设置为1，能够快速的淘汰无用数据，对于节省存储空间和提高查询速度有效果。不过这类需求在海量数据领域比较小众。

      (2)压缩算法：可以尝试一下最新出炉的snappy算法，相对lzo来说，压缩率接近，压缩效率稍高，解压效率高很多。

      (3)inmemory：表在内存中存放，一直会被忽略的属性。如果完全将数据存放在内存中，那么hbase和现在流行的内存数据库memorycached和redis性能差距有多少，尚待实测。

      (4)bloomfilter：根据应用来定，看需要精确到rowkey还是column。不过这里需要理解一下原理，bloomfilter的作用是对一个region下查找记录所在的hfile有用。即如果一个region下的hfile数量很多，bloomfilter的作用越明显。适合那种compaction赶不上flush速度的应用。

      2、rowkey

       rowkey是hbase的key-value存储中的key，通常使用用户要查询的字段作为rowkey，查询结果作为value。可以通过设计满足几种不同的查询需求。

      (1)数字rowkey的从大到小排序：原生hbase只支持从小到大的排序，这样就对于排行榜一类的查询需求很尴尬。那么采用rowkey = Integer.MAX_VALUE-rowkey的方式将rowkey进行转换，最大的变最小，最小的变最大。在应用层再转回来即可完成排序需求。

      (2)rowkey的散列原则：如果rowkey是类似时间戳的方式递增的生成，建议不要使用正序直接写入rowkey，而是采用reverse的方式反转rowkey，使得rowkey大致均衡分布，这样设计有个好处是能将regionserver的负载均衡，否则容易产生所有新数据都在一个regionserver上堆积的现象，这一点还可以结合table的预切分一起设计。

      3、columnfamily

      columnfamily尽量少，原因是过多的columnfamily之间会互相影响。

      4、column

      对于column需要扩展的应用，column可以按普通的方式设计，但是对于列相对固定的应用，最好采用将一行记录封装到一个column中的方式，这样能够节省存储空间。封装的方式推荐protocolbuffer。

     

     以下会分场景介绍一些特殊的表结构设计方法，只是一些摸索，欢迎讨论：

      value数目过多场景下的表结构设计：

       目前我碰到了一种key-value的数据结构，某一个key下面包含的column很多，以致于客户端查询的时候oom，bulkload写入的时候oom，regionsplit的时候失败这三种后果。通常来讲，hbase的column数目不要超过百万这个数量级。在官方的说明和我实际的测试中都验证了这一点。

       有两种思路可以参考，第一种是单独处理这些特殊的rowkey，第二种如下：

      可以考虑将column设计到rowkey的方法解决。例如原来的rowkey是uid1,，column是uid2，uid3...。重新设计之后rowkey为<uid1>~<uid2>，<uid1>~<uid3>...当然大家会有疑问，这种方式如何查询，如果要查询uid1下面的所有uid怎么办。这里说明一下hbase并不是只有get一种随机读取的方法。而是含有scan(startkey,endkey)的扫描方法，而这种方法和get的效率相当。需要取得uid1下的记录只需要new Scan("uid1~","uid1~~")即可。

       这里的设计灵感来自于hadoop world大会上的一篇文章，这篇文章本身也很棒，推荐大家看一下http://www.cloudera.com/resource/hadoop-world-2011-presentation-slides-advanced-hbase-schema-design/

其他参考资料：

HBase性能优化方法总结（一）：表的设计
http://www.cnblogs.com/panfeng412/archive/2012/03/08/hbase-performance-tuning-section1.html

关于cloumn family的描述：不要在一张表里定义太多的column family。目前Hbase并不能很好的处理超过2-3个column family的表。因为某个column family在flush的时候，它邻近的column family也会因关联效应被触发flush，最终导致系统产生更多的I/O。



一、把一个传统的关系型数据库中的数据映射到hbase，从性能的角度如何优化ColumnFamily和qualifierColumn.

二、两个比较极端的情况，（1）关系型数据库中的每一列对应一个columnFamily，（2）关系型数据库中一张表对应一个columnFamily。

三、从读的角度分析性能

（1）如果columnFamily越多，读取一个cell的速度优势是比较明显的，因为找到这个columnfamily，就等于找了column及其对应的值；

（2）如果一张表对应一个columnfamily，找到对应的rowkey后，要把columnfamily对应的多列值都读取到，这样磁盘io和网络消耗的都比较多，速度会慢些。

（3）如果某些列是经常要一起读取的，把这些归到一个columnfamily后面，一次请求就可以获取这些列，比分多次请求获取效率要高。

四、从写的角度分析性能

（1）从regionserver内存消耗角度，根据hbase特点，一个columnfamily对应一个HStore,而每一个Hstore都有一个自己的memstore，如果columnfamily太多，对regionserver的内存消耗就很大。

（2）从flush和compaction角度，目前hbase的flush和compaction都是以region为单位（虽然触发这个动作的条件有多个），如果columnfamily太多，很容易触发flush操作，对于很多memstore中的数据量可能还很少，这样flush就会产生大量小文件，而大量的小文件（即storefile）就会触发compaction操作，频繁的这样操作，会降低集群的性能。

（3）从split角度分析，storefile是以columnfamily为单位的，大量的columnfamily可以减少split的发生，但这是一把双刃剑；因为的更少的split会导致部分region过于偏大，而regionserver之间进行balance时按region的数量进行负载均衡而不是按region的大小，这样可能就会导致balance失效。从好的一方面来看，更少的split会让集群运行的更稳定，然后选择在集群空闲或压力小的时候手动执行split和balance。

（4）因此对于写部分，一般离线集群，一张表使用一个columnfamily即可，对于在线集群，可以根据情况合理分配columnfamily个数。

补充：目前我们的集群是在线集群，我们有一张在线使用表存储了很多数据，经过综合考虑只设计了一个columnfamily，主要考虑到，对于这个表中数据，每天查询量可以打三千万左右次，而表中每天新增数据只有几十G，这样设计可以减少split和flush的操作，让集群更多的时间处在稳定运行状态，这样有利于查询。





### HBase 集群管理
```
${HBASE_HOME}/bin/

start-hbase.sh   启动
stop-hbase.sh    暂停


# master  zookepper   regionserver

HBase Jps进程：

HMaster           ：必须，说明该Hbase是master，
QuorumPeerMain    ：必须，单独配置的zookepper集群，内置的则为HQuorumPeer
HRegionServer     ：非必须，因为我们也将该Master设置为RegionNameNode//必须，任务调度器

SencondNameNode   ：必须，任务调度器
QuorumPeerMain    ：必须，单独配置的Zookeeper集群，如果是内置的则为HQuorumPeer
DataNode          ：必须，数据存储相关
HRegionServer     ：必须，表明是hbase存储节点



```



