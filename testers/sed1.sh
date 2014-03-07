#/bin/bash
#
#
origin:
abc
123
kkk
xxyuj

添加
sed '/abc/aaaaaaa\' ../fixtures/source.txt

sesult:
abc
aaaaaa
123
kkk
xxyuj
插入
sed '/abc/iaaaaaa\' ../fixtures/source.txt

aaaaaa
abc
123
kkk
xxyuj

插入多行最好引入变量。多行插入不是sed的菜。

multiline_string=$(cat <<OOO
abc
bin
case word in
    pattern )
        ;;
esac
OOO
)

sed "s#\\(< /tags>\\)#${multiline_string}\1#"