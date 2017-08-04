---
layout: default
title: 解决每次git push都要输入用户密码的问题
---

## 解决每次git push都要输入用户密码的问题

**问题原因：**
连接远程仓库时用的https方式而不是ssh方式。

**解决方法：**
改成ssh方式

1. 查看连接协议：
```
$ git remote -v
```
2. 改为ssh：
```
$ git remote rm origin
$ git remote add origin git@github.com:li-tianqi/blog.git
$ git push origin
```

**可能遇到的问题：**
Permission denied (publickey).
原因：未设置公钥