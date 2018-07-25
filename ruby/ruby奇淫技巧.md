### to_a shuffle join  sample, first

```ruby
# to_a 生成数组
(1..10).to_a
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# shuffle 随机取数
(1..10).to_a.shuffle[1..5]
[3, 9, 5, 4, 8]

# join array->string
(1..10).to_a.shuffle[1..5].join
"629510"

# 有数字和大写的组合
['a'..'z','0'..'9',*'A'..'Z'].sample(8).join

('0'..'z').to_a.shuffle.first(8).join
```

### ruby中的迭代器 each collect 
```ruby
# each
nums= [1, 2, 3, 4, 5]
nums.each do |i|
	puts i
end

nums.each {|i| puts i}

# 多次输出
3.times {print "输出\n"}

输出
输出
输出

# collect
collection = collection.collect

b = Array.new
b = nums.collect { |x| x}
puts b

1
2
3
4
5
 => nil

b = nums.collect { |x| 10*x} 
[10, 20, 30, 40, 50]
```

### abbrev
```
require 'abbrev'
require 'pp' #打印出来

pp Abbrev.abbrev(['numbers', 'target'])

Abbrev.abbrev(%W{ ruby rules })

%w{ ruby rules }.abbrev

Abbrev.abbrev(%w{car box cone crab}, /b/)
#=> {"box"=>"box", "bo"=>"box", "b"=>"box", "crab" => "crab"}

Abbrev.abbrev(%w{car box cone}, 'ca')
#=> {"car"=>"car", "ca"=>"car"}
```

### ruby中的数组
```
http://docs.w3cub.com/ruby~2.5/array/
```