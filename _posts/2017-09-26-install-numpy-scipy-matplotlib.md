---
layout: post
title: 安装numpy, scipy, matplotlib
categories: [Ubuntu, Python]
tags: [python3]
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## 安装numpy, scipy, matplotlib

Ubuntu中安装python的numpy, scipy, matplotlib库，以及在win10的Linux子系统中使用Xming提供图形界面显示

<!--more-->

### 安装几个库

基于python3的pip安装

``` 
$ sudo apt-get install python3-pip
$ sudo pip3 install numpy 
$ sudo pip3 install scipy 
$ sudo pip3 install matplotlib 
$ sudo apt-get install python3-tk
```

### 安装配置Xming

win10的Linux子系统默认不能用图形界面，也就不能显示matplotlib的画图，可以通过[Xming](https://en.wikipedia.org/wiki/Xming)弥补

[下载Xming](https://sourceforge.net/projects/xming/) 安装

为了不用每次使用都指定display变量，把它配置到环境变量中

在`~/.bashrc`文件中添加:

`export DISPLAY=localhost:0.0`  