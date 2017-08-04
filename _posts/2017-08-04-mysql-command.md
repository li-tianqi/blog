---
layout: default
title: MySQL命令
---

## MySQL命令记录
- 查看数据库：
> SHOW DATABASES;
- 创建数据库：
> CREATE DATABASE db_name;
- 选择数据库：
> USE db_name;
- 查看表：
> SHOW TABLES;
- 查看数据库编码：
> SHOW VARIABLES LIKE 'character%';
- 修改编码为utf8:
> 修改文件/etc/mysql/my.cnf，添加:
```
> [client]
> default-character-set=utf8
> [mysqld]
> character-set-server=utf8
> [mysql]
> default-character-set=utf8
```
> 重启mysql
```
$ service mysql restart
```

