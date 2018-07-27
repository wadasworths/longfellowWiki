## Ruby 2.5 文档，标准函数库等

Author：longfellow (longfellow.wang@gmail.com)
Date：2018-07-27
Version：

#### module Abbrev

计算给定字符串的特定缩写，可以是单个字符，也可以是字符数组

```ruby
require 'abbrev'
require 'pp' # 打印

pp Abbrev.abbrev(['ruby'])
{"ruby"=>"ruby", "rub"=>"ruby", "ru"=>"ruby", "r"=>"ruby"}
 => {"ruby"=>"ruby", "rub"=>"ruby", "ru"=>"ruby", "r"=>"ruby"}

pp Abbrev.abbrev(['ruby', 'rules'])
{"ruby"=>"ruby",
 "rub"=>"ruby",
 "rules"=>"rules",
 "rule"=>"rules",
 "rul"=>"rules"}

pp %w{ summer winter }.abbrev # 输出同上

Abbrev.abbrev(%w{ car cone })
#=> {"ca"=>"car", "con"=>"cone", "co"=>"cone", "car"=>"car", "cone"=>"cone"}

2.4.2 :049 >   Abbrev.abbrev(%w{ abc abroad defetion deactiace}, 'd')
 => {"defetion"=>"defetion", "defetio"=>"defetion", "defeti"=>"defetion", "defet"=>"defetion", "defe"=>"defetion", "def"=>"defetion", "deactiace"=>"deactiace", "deactiac"=>"deactiace", "deactia"=>"deactiace", "deacti"=>"deactiace", "deact"=>"deactiace", "deac"=>"deactiace", "dea"=>"deactiace"} 
```

abbrev是一个很好用的字符串处理函数

#### class ARGF

```
Parent : Object
Include modules : Enumerable
```

ARGF is a stream designed for use in scripts that process files given as command-line arguments or passed in via STDIN.

官方文档给出的用处，处理命令行参数或者标准输入。 注意：ARGF is a stream


#### module Benchmark 

检测ruby代码执行的时间

```ruby
require 'benchmark'

puts Benchmark.measure { "a"*1_000_000_000 }

0.250000   0.340000   0.590000 (  0.665691) #输出
# 依次是 使用CPU时间，系统时间，CPU+System time,  the elapsed real time(全部时间)
```