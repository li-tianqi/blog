---
layout: post
title: Windows 10内置Linux子系统
categories: [Ubuntu, Tutorial]
tags: [shell]
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## Win10内置Linux子系统
从win10的1607版本开始，新加入了内置的Linux子系统，比虚拟机或者双系统用起来更加方便，而且对机器性能要求更低。  
Linux子系统默认是未启用的，下面给出启用它的方法。

<!--more-->

## 启用内置Linux子系统
### step1.检查系统是否符合要求
对该功能的支持需要win10系统在一周年正式版及以上，也就是`1607`版以上  
首先确认自己系统版本  
在`设置-系统-关于`中查看`版本`，确保是`1607`以上，如果不是，请升级系统    
![](../assets/post_images/20170904/01.png)

我这里是`1703`版本  

### step2.启用开发人员模式
在`设置-更新和安全-针对开发人员`中，选择`开发人员模式`，根据弹出窗口提示操作  
![](/assets/post_images/20170904/02.png)

### step3.开启适用于Linux的Windows子系统
打开`控制面板-程序-程序和功能-启用或关闭 Windows 功能`，勾选`适用于Linux的Windows子系统(Beta)`，根据弹出窗口提示操作，重启电脑  
*注： `控制面板` 可通过 `小娜` 搜索打开,  `1703` 版之前还可以通过 `win+x` 快捷键选择控制面板功能*  
![](/assets/post_images/20170904/03.png)
  
  
![](/assets/post_images/20170904/04.png)

### step4.配置子系统
重启后，打开`命令行`或`Windows PowerShell`，输入`bash`，回车，根据命令行提示，完成`Ubuntu`的配置（包括用户名，密码等）  

**到此就完成了Ubuntu子系统的启用**  

可以尝试输入一些`bash`命令测试一下，比如`ls`  

### step5.Ubuntu子系统的使用方法
之后要使用子系统，只要打开`命令行`或`Windows PowerShell`，输入`bash`，回车，即可进入Ubuntu环境  

## 注
*1. 在某一目录下，不要选中任何文件，按住 `shift` 键后点击鼠标 `右键` ，可以发现选项中多出了 `在此处打开Powershell窗口` 或 `在此处打开命令行` 选项，可以直接在该目录下打开 `命令行` 或 `Windows PowerShell`*  
*2. Linux子系统其实不止Ubuntu，还包括大部分是发行版Linux，只是Ubuntu用的相对较多，其他系统的使用方法这里不做介绍，有兴趣的可以查看其他教程*  
*3. 子系统默认只有命令行，但其实也可以运行图形化程序，可以借助 <a href="https://baike.baidu.com/item/Xming" target="_blank">Xming</a> 这一工具实现，具体方法请参考其他教程*  

目前我在图形化显示方面的需求主要是用python分析数据画图时，需要显示图形，具体效果如下  

<!--百度：https://baike.baidu.com/item/Xming-->
<!--wiki：https://en.wikipedia.org/wiki/Xming-->

![](/assets/post_images/20170904/05.png)
