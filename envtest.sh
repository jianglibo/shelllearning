#!/bin/bash

#env 是 environment (環境) 的簡寫啊，
#上面的例子當中，是列出來所有的環境變數。
#當然，如果使用 export 也會是一樣的內容～
#只不過， export 還有其他額外的功能就是了，我們等一下再提這個 export 指令。
# 那麼上面這些變數有些什麼功用呢？底下我們就一個一個來分析分析！

#set
# 用 set 觀察所有變數 (含環境變數與自訂變數)

# export 變數名稱,自訂變數轉成環境變數
#那如何將環境變數轉成自訂變數呢？可以使用本章後續介紹的 declare 呢！

# [root@www ~]# declare [-aixr] variable
# 選項與參數：
# -a  ：將後面名為 variable 的變數定義成為陣列 (array) 類型
# -i  ：將後面名為 variable 的變數定義成為整數數字 (integer) 類型
# -x  ：用法與 export 一樣，就是將後面的 variable 變成環境變數；
# -r  ：將變數設定成為 readonly 類型，該變數不可被更改內容，也不能 unset
#
# 範例一：讓變數 sum 進行 100+300+50 的加總結果
# [root@www ~]# sum=100+300+50
# [root@www ~]# echo $sum
# 100+300+50  <==咦！怎麼沒有幫我計算加總？因為這是文字型態的變數屬性啊！
# [root@www ~]# declare -i sum=100+300+50
# [root@www ~]# echo $sum
# 450         <==瞭乎？？
#
#  cut, grep
#  xargs 這個玩意兒就是在產生某個指令的參數的意思
#[root@www ~]# cut -d'分隔字符' -f fields <==用于有特定分隔字符
#[root@www ~]# cut -c 字符区间            <==用于排列整齐的信息

# head -n 4
# tail -n 4

# sed -n '5,7p' 打出5到7行，n安静模式
# /sbin/ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*$//g'
#  alias myip="ifconfig eth0 | grep 'inet addr' | sed 's/^.*inet addr://g'| cut -d ' ' -f1 "

sed 's|\(http://[^/]*/\).*|\1|g'

echo "http://www.suon.co.uk/product/1/7/3/" | sed -n 's;\(http://[^/]*\)/.*;\1;p'



curl -o /path/to/local/file http://url.com ，save as
curl http://url.com > /path/to/local/file，save origin name

URL=http://dl.bintray.com/vertx/downloads/vert.x-2.1RC1.tar.gz
FN=$(echo $URL | sed 's/.*\///g')
curl -L -o $FN $URL

curl，如果curl没有安装，则返回$? -eq 127，否则返回2
bash，也可以这样测试

#!/bin/bash
read var_year
echo "The year is: $var_year"

echo -n "Enter your name and press [ENTER]: "
read var_name
echo "Your name is: $var_name"

Bash includes the ‘<<<’ redirection operator, allowing a string to be used as the standard input to a command.

IFS=";" ;read var1 var2 <<< "x;y"

[[]] No filename expansion or word splitting takes place between [[ and ]], but there is parameter expansion and command substitution.

分词是在命令处理期间进行，而不是在结果中进行