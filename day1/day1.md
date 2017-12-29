# 1 构建基本脚本
## 1.1 使用多个命令
将多个命令放在同一行中，用分号隔开，就可使他们一起运行，如下：
```
$ date;who
2017年 12月 29日 星期五 17:51:41 CST
li       tty7         2017-12-29 17:51 (:0)
```
## 1.2 创建shell脚本文件
在创建shell脚本时，必须在第一行指定要使用的shell，其格式为：
```
#!/bin/bash
```
在通常的shell脚本文件中，#用作注释，shell并不处理注释行。但是第一行是个例外，#后面的!会告诉shell使用哪个shell来运行脚本。第一个shell脚本如下：
```
#!/bin/sh
# This script displays the date and who's logged on
date
who
```
执行shell脚本时，会提示权限不够，此时使用chmod可以解决，结果如下：
```
chmod u+x ./test1.sh
$ ./test1.sh
2017年 12月 29日 星期五 18:09:04 CST
li       tty7         2017-12-29 17:51 (:0)
```
## 1.3 显示消息
echo命令后加一串字符串，就能显示此字符串，默认情况下不需要引号划定字符串。同时，echo命令还可以使用单引号或双引号来划定文本字符串，如果在字符串中存在引号，则在文本中使用一种引号，而使用另一种引号将字符串划定开来。可以将echo语句添加到shell脚本任何需要额外显示信息的地方。使用-n参数可以使文本字符串和命令输出显示在同一行中，但是需要在字符串的两侧使用引号，同事保证字符串尾部有一个空格。测试脚本如下：
```
#!/bin/sh
# This script displays the date and who's logged on
echo -n "The time and date are: "
date
who
```
程序运行结果如下：
```
$ ./test1.sh
The time and date are: 2017年 12月 29日 星期五 18:20:22 CST
li       tty7         2017-12-29 17:51 (:0)
```
## 1.4 使用变量
### 1.4.1 环境变量
使用set命令可以获得完整的当前环境变量表。，在脚本中，可以在环境变量名前加上$来使用这些变量，测试程序如下：
```
#!/bin/bash
# This script displays user information from the system.
echo "User info for userid: $USER"
echo UID: $UID
echo HOME: $HOME
```
程序运行结果如下：
```
$ ./test2.sh
User info for userid: li
UID: 1000
HOME: /home/li
```
在echo命令中的环境变量会在脚本运行时替换成当前值，即使放在双引号中，shell依然能够知道我们的意图，如果想shell显示$号，必须加上反斜杠'\'。
### 1.4.2 用户变量
用户变量可以是任何由字母、数字或下划线组成的文本字符串，长度不超过20，用户变量区分大小写。使用等号进行赋值操作时，在变量、等号和值之间不能出现空格。shell脚本会自动决定变量值的数据类型，在脚本的生命周期内，shell脚本中的变量会一直保持着他们的值，在脚本结束时会被删除，用户变量可以通过$引用。测试程序如下：
```
#!/bin/bash
# testing variables
days=10
guest="Katie"
echo "$guest checked in $days days ago"
days=5
guest="Jessica"
echo "$guest checked in $days days ago"
```
程序运行结果如下：
```
$ ./test3.sh
Katie checked in 10 days ago
Jessica checked in 5 days ago
```
变量每次被引用时，都会输出当前赋给它的值，引用一个变量的值需要用$，而引用变量来对其进行赋值则不要，测试程序如下：
```
#!/bin/bash
# assigning a variable value to another variable

value1=10
value2=$value1
value3=value1

echo The resulting value is $value2
echo value3 is $value3
```
程序结果如下：
```
$ ./test4.sh
The resulting value is 10
value3 is value1
```
没有$，shell会将变量名解释为普通的文本字符串
### 1.4.3 命令替换
命令替换允许你将shell命令的输出赋给变量，有两种方法可以将命令输出赋给变量：（１）使用反引号字符'`'；（２）使用$()格式。测试程序如下：
```
#!/bin/bash
testing=$(date)
test2=`who`
echo $testing
echo $test2
```
结果如下：
```
$ ./test5.sh
2017年 12月 29日 星期五 19:07:36 CST
li tty7 2017-12-29 17:51 (:0)
```
