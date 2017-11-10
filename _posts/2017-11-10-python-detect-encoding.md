---
layout: post
title: Python检测文件编码格式
categories: [Python]
tags: [python3]
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## Python检测文件编码格式

python3打开文件时默认以`utf-8`解析, 遇到非此编码文件, 会出现错误, 需要指定编码, 所以要检测文件编码

<!--more-->

方法: 

用二进制打开-> 用`chardet` 检测

```python
import chardet

with open(filename, "rb") as f:
	data = f.read()
	print(chardet.detect(data))
```

