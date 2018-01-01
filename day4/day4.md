# 3 更多的结构化命令
## 3.1 for命令
for命令允许你创建一个遍历一系列值的循环，每次迭代都使用其中的一个值来执行已经定义好的一组命令。结构如下：
```
for var in list
do
  commands
done
```
do和for语句可以放在同一行，但是必须用分号分隔，如下：
```
for var in list; do
```
### 3.1.1 读取列表中的值
测试如下：
```
#!/bin/bash
for test in A B C D
do
  echo the next state is $test
done

echo $test

test=Hello
echo The new string is $test
```
结果如下：
```
$ ./test1.sh
the next state is A
the next state is B
the next state is C
the next state is D
D
The new string is Hello
```
$test变量保存了其值，也允许我们进行修改。
### 3.1.2 读取列表中的复杂值
for循环中假定是用空格分隔每个值，如果数据值包含空格，需要用双引号圈出来。同时，数据值中如果存在单引号必须使用转义字符或者使用双引号来定义要用的值。测试如下：
```


```
