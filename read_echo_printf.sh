###the different between echo and printf
###test_read_echo_printf.txt
###1 2 3 4
###5 6 7 8
###9

####echo会根据IFS对内容进行分配输出；printf会根据format对变量进行分配值输出

###read will designate the content separated by IFS to the variable (first, last..)
cat test_read_echo_printf.txt | while read first last
do
    echo $first  ##打印IFS分配的第一部分内容
    echo $last  ##打印IFS分割剩下的所有内容，无法分配变量的内容给予最后一个变量
done

###IFS is used to divide the input line
###read -r, raw mode, 原样读取，不把反斜杠字符解释为转义字符
###IFS= , 这里表示取消IFS
###while IFS= read -r line 
###do
###    ...
###done

###printf will keep on fitting variables into format string until all of them are exhausted
###read a b c <<<"1 2 3 4"
###printf "%d %d %d\n" "$a" "$b" "$c" ##加引号后同报错$c为"3 4"，不为数字
###printf "%d %d %d\n" $a $b $c 

cat test_read_echo_printf.txt | while read a b c 
do
    printf "%d %d %d\n" $a $b $c ##这里$c就为3，持续对4分配变量，缺少内容用0补齐
    printf "%d %d %d\n" "$a" "$b" "$c" ##加引号这里$c就为"3 4"，报错不为数字
done

