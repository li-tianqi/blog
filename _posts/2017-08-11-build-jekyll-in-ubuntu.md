---
layout: post
title: Ubuntu搭建jekyll环境
categories: [Ubuntu, Web]
tags: jekyll
excerpt_separator: <!--more-->
---

jekyll环境搭建

<!--more-->

## Ubuntu中搭建jekyll环境
### 1. 安装ruby
```
$ sudo apt-get install ruby ruby-dev
```
测试安装结果  
```
$ ruby -v
```

### 2. 安装nodejs
> 之所以要安装nodejs是因为ruby的gem管理需要用到nodejs环境 

```
$ sudo apt-get install nodejs
```
测试  
```
$ $ gem -v
```

### 3. 安装jekyll
```
$ sudo gem install jekyll
```
测试  
```
$ jekyll new ttestblog
```
创建成功说明安装成功

*注：可能遇到问题：*  
提示  
> Dependency Error: Yikes! It looks like you don't have bundler or one of its dependencies installed. In order to use Jekyll as currently configured, you'll need to install this gem. The full error message from Ruby is: 'cannot load such file -- bundler' If you run into trouble, you can find helpful resources at https://jekyllrb.com/help/! 
jekyll 3.5.1 | Error:  bundler  
解决方法：安装bundler
```
$ sudo gem install bundler
```

### 4. 查看生成的项目
```
$ jekyll serve
```
浏览器输入`127.0.0.1:4000`
