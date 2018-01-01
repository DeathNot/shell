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
#!/bin/bash

for test in i don\'t know if "this'll" work "New York"
do
  echo words:$test
done
```
结果如下：
```
$ ./test2.sh
words:i
words:don't
words:know
words:if
words:this'll
words:work
words:New York
```
可以将一系列值存储在一个变量中，然后遍历变量中的整个列表。也可以用命令替换来执行任何能产生输出的命令，然后在for命令中使用该命令的输出。测试如下：
```
#!/bin/bash
list="Hello Indian mi fan"
list=$list" Do you like me"  # 向list列表中添加值
#从变量读取列表
for word in $list　　　
do
  echo $word
done

echo Test2
filename="test.txt"
#此脚本中文件名中没有加入路径，所以要求文件和脚本在同一目录下，
#否则需要使用全路径名。
#从命令读取值
for s in $(cat $filename)
do
  echo $s
done
```
### 3.1.３　更改字段分隔符
环境变量IFS，即内部字段分隔符，定义了用作分隔符的一系列字符，默认情况下，字段分隔符为：空格，制表符，换行符。可以在脚本中临时修改IFS环境变量的值来限制被当做字段分隔符的字符。使用方式如下：
```
IFS=$'\n'  #只使用换行符作为字段分隔符
IFS=$'\n':;"  #将换行符、冒号、分号、双引号作为字段分隔符
IFS.OLD=$IFS
IFS='\n'
IFS=$IFS.OLD
```
需要将多个字符当做字段分隔符时，只需要将他们串起来即可。在处理代码量较大的脚本中，如果有地方需要修改，而有的地方需要用默认的，最好在改变之前保存原来的IFS的值。
### 3.1.４　用通配符读取目录
可以使用for命令来自动遍历目录中的文件，此时，必须在文件名或者路径名中使用通配符。它会强制shell使用文件扩展匹配，文件扩展匹配是生成匹配指向通配符的文件名或路径名的过程。测试如下：
```
#!/bin/bash
for file in /home/li/Desktop/*
do
  if [ -d "$file" ]
  then
    echo "$file is a directory!"
  elif [[ -f "$file" ]]; then
    echo "$file is a file!"
  fi
done
```
由于目录名和文件名中是允许包含空格的，所以将$file用双引号圈起来是一个好的习惯。在for命令中也可以列出多个目录通配符，将目标查找和列表合并进同一个for语句。在处理文件或者目录时，最好先测试下文件或目录是否存在。
## 3.2 C语言风格的for命令
shell脚本也支持一种c语言风格的循环，但有细微差别。c语言风格的for命令结构如下：
```
for (( var assignment ; condition ; iteration process ))
```
同时，c语言风格的for命令也允许为迭代使用多个变量，但在for循环中只能使用一个条件。
测试如下：
```
#!/bin/bash
for (( i = 0; i < 5; i++ ))
do
  echo The number is $i
done

for (( a = 1, b = 5; a < b; a++, b-- ))
do
  echo "$b - $a"
done
```
## 3.2 while命令
