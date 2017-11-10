---
layout: post
title: nokogiri安装失败问题
categories: [Ubuntu, Web]
tags: [jekyll]
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## nokogiri安装失败问题

使用Jekyll时提示要安装nokogiri, 安装出错  

根据提示, 要参考日志文件

<!--more-->

日志文件中显示缺少`zlib.h`, 经百度, 对应的包为`zlib1g-dev`

安装之

```
apt-get install zlib1g-dev

sudo gem install nokogiri
```

成功!