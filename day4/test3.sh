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
