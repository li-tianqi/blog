---
layout: post
title: Python struct模块
categories: [Python]
tags: [python3]
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

## Python struct 模块

在解析pcap文件时需要处理二进制数据，找到了Python的struct模块

其最重要的3个函数：

```python
pack(fmt, v1, v2, ...)	# 返回bytes, 按指定格式‘fmt’封装数据v1，v2, ...
unpack(fmt, buffer)	# 返回元组， 按指定格式‘fmt’解析bytes
calcsize(fmt)	# 返回int，计算指定格式‘fmt’所占字节数
```

<!--more-->

### fmt格式

| fmt  | C type             | Python type | number of bytes |
| ---- | ------------------ | ----------- | --------------- |
| x    | pad byte           | no value    | 1               |
| c    | char               | str (len=1) | 1               |
| b    | signed char        | int         | 1               |
| B    | unsigned char      | int         | 1               |
| ?    | bool               | bool        | 1               |
| h    | short              | int         | 2               |
| H    | unsigned short     | int         | 2               |
| i    | int                | int         | 4               |
| I    | unsigned int       | int         | 4               |
| l    | long               | int         | 4               |
| L    | unsigned long      | long        | 4               |
| q    | long long          | long        | 8               |
| Q    | unsigned long long | long        | 8               |
| f    | float              | float       | 4               |
| d    | double             | float       | 8               |
| s    | char[]             | string      | 1               |
| p    | char[]             | string      | 1               |
| P    | void *             | long        |                 |

注：

1. `q, Q`只在64位系统有意义
2. `fmt`前可以加数字，表示个数，如`5i`表示5个整数
3. `s`表示一定长度的字符串，`3s`表示长度为3的字符串
4. `p`表示pascal字符串

### 字节对齐方式

在`fmt`前加对应符号：

| character | byte order    | size & alignment |
| --------- | ------------- | ---------------- |
| @         | native        | native & 填充够4字节  |
| =         | native        | standard & 原字节数  |
| <         | little-endian | standard & 原字节数  |
| >         | big-endian    | standard & 原字节数  |
| !         | network (>)   | standard & 原字节数  |

### 举例

``` python
a = pack('3I', 12, 24, 50)
# a = b'\x0c\x00\x00\x00\x18\x00\x00\x002\x00\x00\x00'
b = unpack('3I', a)
# b = (12, 24, 50)
size_I = calcsize('I')
# size_I = 4
c = pack('<I', 12)
# c = b'\x0c\x00\x00\x00'
d = pack('>I', 12)
# d = b'\x00\x00\x00\x0c'
c1 = unpack('<I', c)
# c1 = (12,)
c2 = unpack('>I', c)
# c2 = b'\x00\x00\x00\x0c'
```

