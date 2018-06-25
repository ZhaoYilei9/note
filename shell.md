## shell:

```
#!/bin/bash
# Program to output a system information page
title="System Information Report"
echo "<HTML>
        <HEAD>
                <TITLE>$title</TITLE>
        </HEAD>
        <BODY>
                <H1>$title</H1>
        </BODY>
</HTML>"
```

通过创建一个名为 title 的变量，并把 “System Information Report” 字符串赋值给它，我们就可以利用参数展开功能，把这个字符串放到文件中的多个位置。

### 创建一个变量

```
[me@linuxbox ~]$ foo="yes"
[me@linuxbox ~]$ echo $foo
yes
[me@linuxbox ~]$ echo $fool
[me@linuxbox ~]$
```

首先我们把 “yes” 赋给变量 foo，然后用 echo 命令来显示变量值。接下来，我们显示拼写错误的变量名 “fool” 的变量值，然后得到一个空值。因此，我们必须小心谨慎地拼写！同样理解实例中究竟发生了什么事情也 很重要。

```
有一些关于变量名的规则：

变量名可由字母数字字符（字母和数字）和下划线字符组成。

变量名的第一个字符必须是一个字母或一个下划线。

变量名中不允许出现空格和标点符号。
```

