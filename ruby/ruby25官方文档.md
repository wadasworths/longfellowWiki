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
```