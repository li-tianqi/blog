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

**解决方法：**

1. 生成本机公私钥：  
```
$ ssh-keygen -t rsa
```  
*三次回车*  
2. 查看公钥：  
```
$ cat ~/.ssh/id_rsa.pub
```
3. 将公钥添加到github的ssh key:  
- 登录GitHub，选择sittings -> SSH and GPG keys -> New SSH key  
- Title随意填  
- Key处将公钥里的内容复制进去  
- Add SSH key  

*注：不同用户的公私钥是独立的，包括root用户和普通用户，所以添加普通用户的公钥后，root用户还是无法正常用SSH的，还需单独添加。*
