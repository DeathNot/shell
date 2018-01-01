# 2 使用结构化命令
## 2.1 使用if-then语句
if-then语句格式如下：
```
if command
then
  commands
fi
```
在shell中，if语句会运行if后面的那个命令，如果该命令的退出状态码为0，则then后面的语句就会执行，否则，不执行。fi表示if-then语句到此结束。测试程序如下：
```
#!/bin/bash
if pwd
then
  echo "Hello world!"
fi
```
结果如下：
```
$ ./test1.sh
/home/li/Project/shell/day3
Hello world!
```
if-then语句的另一种形式为
```
if command; then
  commands
fi
```
## 2.2 if-then-else语句
形式如下：
```
if command
then
  commands
else
  commands
fi
```
当if语句中的命令返回退出状态码为0时，then里面的会被执行，非零则执行else中的命令，测试程序如下：
```
#!/bin/bash
testuser=NoSuchUser
if grep $testuser /etc/passwd
then
  echo "Hello world!"
else
  echo "Failed!"
fi
```
结果如下：
```
$ ./test2.sh
Failed!
```
## 2.3 嵌套if
有两种方式可以实现if-then语句的嵌套，第一种形式如下：
```
if command
then
  commands
else
  if command
  then
    commands
  fi
fi
```
第二种形式如下：
```
if command
then
  commands
elif command2
  more commands
fi
```
在elif语句中，紧跟其后的else属于elif代码块，并不属于之前的if-then代码块。
## 2.4 test语句
test命令中列出的条件如果成立，test就会退出并返回退出状态码0，不成立则返回非零的退出状态码。格式如下：
```
test condition
```
在if-then语句中使用test形式如下：
```
if test condition
then
  commands
fi
```
如果不写test命令的condition部分，则会以非零的退出状态码退出。
测试程序如下：
```
#!/bin/bash
var1="Hello"
var2=""

if test $var1
then
  echo $var1 World!
else
  echo Nothing!
fi

if test $var2
then
  echo Hello World!
else
  echo Nothing!
fi

if test
then
  echo Success!
else
  echo Failed!
fi
```
运行结果如下：
```
$ ./test3.sh
Hello World!
Nothing!
Failed!
```
另一种条件测试方法是使用方括号，这样无需在if-then语句中声明test命令
```
if [ condition ]
then
  commands
fi
```
其中，第一个方括号之后和第二个方括号之前必须加上空格。
### 2.4.1　数值比较
测试两个值时可用的条件参数如下表：
```
n1 -eq n2  //equal =
n1 -ge n2  // greater or equal >=
n1 -gt n2  //greater than >
n1 -le n2  //less or equal <=
n1 -lt n2  //less than <
n1 -ne n2  // not equal !=
```
bash只能处理整数，所以test命令中不能使用浮点值，测试程序如下：
```
#!/bin/bash

var1=10
var2=12

if [ $var1 -gt 5 ]
then
  echo $var1 \> 5
fi

if [ $var1 -ne $var2 ]
then
  echo $var1 is not equal $var2
fi

var3=5.5
if [ $var3 -gt 5 ]
then
  echo Success!
else
  echo Failed!
fi
```
运行结果如下：
```
$ ./test4.sh
10 > 5
10 is not equal 12
./test4.sh: line 17: [: 5.5: integer expression expected
Failed!
```
### 2.4.2 字符串比较
测试两个字符串可用的条件参数如下：
```
str1 = str2
str1 != str2
str1 < str2
str1 > str2
-n str1   //str1的长度是否非0
-z str1   //str1的长度是否为0
```
测试程序如下：
```
#!/bin/bash

testuser=li
if [  $USER = $testuser ]
then
  echo Welcome $testuser
fi

if [ $testuser != $HOME ]
then
  echo Success!
fi

var=Li
if [ $testuser \> $var ]
then
  echo $testuser \> $var
else
  echo $testuser \< $var
fi

var2=''
if [ -z $var2 ]
then
  echo Empty!
fi

if [ -n $var ]
then
  echo $var is not empty!
fi
```
结果如下：
```
$ ./test5.sh
Welcome li
Success!
li > Li
Empty!
Li is not empty!
```
在比较字符串的时候，比较测试会将所有的标点和大小写情况都考虑在内；在比较字符串大小时，大于号和小于号必须转义，并且大于和小于顺序和sort命令所采用的不同。比较测试使用的是标准ASCII顺序，而sort使用的是系统的本地化语言设置中定义的排序顺序。对于英语，本地化设置指定了在顺序排序中小写字母出现在大写字母前。一个未被定义的变量字符串长度认为0。
### 2.4.3 文件比较
文件比较允许你测试文件系统上文件和目录的状态。参数如下表：
```
-d file //是否存在并是一个目录
-e file //是否存在
-f file //是否存在并是一个文件
-r file //是否存在并可读
-s file //是否存在并非空，当-s比较成功时，说明文件中有数据
-w file //是否存在并可写
-x file //是否存在并可执行
-O file //是否存在并属当前用户所有
-G file //是否存在并且默认组和当前用户相同
file1 -nt file2 //file1是否比file2新，使用前必选先确认文件存在
file1 -ot file2 //file1是否比file2旧，使用前必须先确认文件存在
```
## 2.5 复合条件测试
使用格式如下：
```
[ condition ] && [ condition ]
[ condition ] || [ condition ]
```
## 2.6 if-then的高级特性
### 2.6.1 使用双括号
双括号允许你在比较过程中使用高级数学表达式，命令格式如下：
```
(( expression ))
```
除了test命令使用的标准运算符，双括号会用到的其他运算符如下：
```
var++
var--
++var
--var
!   //非
~　 //位求反
**  
<<  //左位移
>>  //右位移
&   //布尔和
|   //布尔或
&&  //逻辑和
||  //逻辑或
```
可以再if语句中使用双括号，也可以在脚本的普通命令中使用来赋值，并且不需要将双括号表达式中的大于号转义。
### 2.6.2 使用双方括号
双方括号提供了针对字符串比较的高级特性，格式如下：
```
[[ expression ]]
```
双方括号使用了test命令中采用的标准字符串比较，并且还提供了模式匹配。
测试如下：
```
#!/bin/bash

if [[ $USER == l* ]]
then
  echo Hello $USER
fi
```
在脚本中，我们使用了"=="，双等号会将后面的视为一个模式。运行结果如下：
```
$ ./test6.sh
Hello li
```
## 2.7 case语句
case语句形式如下：
```
case var in
pattern1 | pattern2) command1;
pattern3) command2;
*) default commands;
esac
```
