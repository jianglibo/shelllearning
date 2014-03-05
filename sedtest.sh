#!/bin/bash

sout=$(echo $PATH | sed -n 's;/sdkids/;;p')

if [[ "$sout" ]]; then
    echo "sed not match,output is true"
else
    echo "sed not match,output is false"
fi

if [[ "$sout" == "" ]]; then
    echo "sed not match,output is empty"
else
    echo "sed not match,output is not empty"
fi

#-n not empty,not null
if [[ -n "" ]]; then
    echo "not set value is null"
fi

if [[ -z "" ]]; then
    echo "empty string is z"
fi

if [[ -z "$notsetvalue" ]]; then
    echo "not set value is z"
fi


echo $sout

*
'\+' one or more
'\?' zero or one
'\{I\}' exact I times
'\{I,J\}' between inclusive
[list]
[^list]

[root@www ~]# sed [-nefr] [动作]
选项与参数：
-n ：使用安静(silent)模式。在一般 sed 的用法中，所有来自 STDIN 的数据一般都会被列出到终端上。但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
-e ：直接在命令列模式上进行 sed 的动作编辑；
-f ：直接将 sed 的动作写在一个文件内， -f filename 则可以运行 filename 内的 sed 动作；
-r ：sed 的动作支持的是延伸型正规表示法的语法。(默认是基础正规表示法语法)
-i ：直接修改读取的文件内容，而不是输出到终端。


nl /etc/passwd | sed '2d'
 nl /etc/passwd | sed '3,$d'
 如果是要增加两行以上，在第二行后面加入两行字，例如『Drink tea or .....』与『drink beer?』
 [root@www ~]# nl /etc/passwd | sed '2a Drink tea or ......\
> drink beer ?'

以行为单位的替换与显示

将第2-5行的内容取代成为『No 2-5 number』呢？

[root@www ~]# nl /etc/passwd | sed '2,5c No 2-5 number'
1 root:x:0:0:root:/root:/bin/bash
No 2-5 number
6 sync:x:5:0:sync:/sbin:/bin/sync
.....(后面省略).....

数据的搜寻并显示
搜索 /etc/passwd有root关键字的行

复制代码
nl /etc/passwd | sed '/root/p'
1  root:x:0:0:root:/root:/bin/bash
1  root:x:0:0:root:/root:/bin/bash
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
4  sys:x:3:3:sys:/dev:/bin/sh
5  sync:x:4:65534:sync:/bin:/bin/sync
....下面忽略
复制代码
如果root找到，除了输出所有行，还会输出匹配行。

数据的搜寻并删除
删除/etc/passwd所有包含root的行，其他行输出

nl /etc/passwd | sed  '/root/d'
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
....下面忽略
#第一行的匹配root已经删除了

