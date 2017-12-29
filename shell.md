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
