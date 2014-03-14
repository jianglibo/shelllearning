#!/bin/env perl
#
#

use strict;

my $tpl= <<CONFIG;
{
    "comboDiskRoot" : "/opt/staticyui",
    "syncRead" : false,
    "maxMem" : 67108864,
    "defaultMaxAge" : 600,
    "versionedMaxAge" : 31536000,
    "listenPort" : 8093,
    "instances" : 5,
    "charset" : "UTF-8"
}
CONFIG

open(CFG_FILE, ">/opt/vertxcombo/conf.json") or die $!;

#no comma allowed after file handler.
print CFG_FILE $tpl;

close(CFG_FILE);

# 1.q 相当于 单引号' '
#    转义字符无效
#      q可以使用（）[] {} // ,,
# 2.qq 相当于" "
#        转义字符有效
#        qq可以使用（）[] {} // ,,
# 3.qw  相当于 （'' ,'' ,' '）在每一个单词上添加 ' '
#     转义字符无效
#    qw可以使用（）[] {} // ,,
#          qq 和qw 区别，qq赋给数组是整体赋给数组的一个元素，而qw则会每个单词算作一个数组元素
# 4.qr   相当于创建正则
#     qr//
# 5.qx 执行外部程序

#  #!/usr/bin/perl -w

#  $text = 'Text from a Perl string.';
#  print <<HTML;
#  <html>
#  <head>
#  <title>Here-Doc Example</title>
#  </head>
#  <body>
#  <h1>Here-Doc Example</h1>
#  <p>$text</p>
#  </body>
#  HTML

# If you do not want your strings to be interpolated, surround the keyword with single quotes like so:
#  print <<'HTML';