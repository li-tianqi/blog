---
layout: post
title: Django学习记录
categories: [Python, Web]
tags: [python3, Django]
excerpt_separator: <!--more-->
---

做一个小工具要用到Django，简单熟悉一下Django创建项目的流程并记录一些需要注意的地方，之前已经搭建过Django开发环境，所以跳过这步。  
直接从建立项目开始。

<!--more-->

### 入门练习

#### 1. 新建项目：
```
$ django-admin.py startproject Demo
```

#### 2. 新建app：
```
cd Demo
$ python3 manage.py startapp Hello
```

#### 3. 项目目录结构：
```
.
├── Hello
│   ├── admin.py
│   ├── apps.py
│   ├── __init__.py
│   ├── migrations
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   └── views.py
├── manage.py
└── Test
    ├── __init__.py
    ├── __pycache__
    │   ├── __init__.cpython-35.pyc
    │   └── settings.cpython-35.pyc
    ├── settings.py
    ├── urls.py
    └── wsgi.py

4 directories, 14 files

```
> 
urls.py

链接入口，关联到对应的 views.py 中的一个函数（或者乘坐 generic 类），访问的链接就对应一个函数。

views.py

处理用户发出的请求，从 urls.py 中对应而来，通过渲染 templates 中的网页可以为用户显示页面内容，比如登录后的用户名，用户请求的数据，通过其输出到页面。

models.py

与数据库操作相关，存入或读取数据时使用。当不使用数据库的时候，也可以当做一般的类封装文件，存储各种类的定义。

forms.py

表单，用户在浏览器上输入提交，对数据的验证工作以及输入框的生成等工作，都依托于此。

admin.py

后台文件，可以用少量的代码就拥有一个强大的后台。

settings.py

Django 的设置、配置文件，比如 DEBUG 的开关，静态文件的位置等等。

除了这些，还有以上目录中未提及的：

templates目录

views.py 中的函数渲染 templates 中的 html 模板，得到动态内容的网页，可以用缓存来提高渲染速度。



#### 4. 编辑views.py文件：
``` python
# coding: utf-8
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    return HttpResponse(u'Hello World')  # u'string' means unicode
```

#### 5. 在settings.py中添加app:
``` python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'Hello',
)
```

#### 6. 配置URL（urls.py）
``` python
from django.conf.urls import include, url

from django.contrib import admin
from Hello import views as Hello_views

admin.autodiscover()

urlpatterns = [
    # Examples:
    # url(r'^$', 'Test.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^index', Hello_views.index)
]
```

#### 7. 测试：
```
$ python3 manage.py runserver 8080
```

浏览器127.0.0.1:8080/index/


#### 8. GET方法传递参数实现加法
``` python
from django.shortcuts import render
from django.http import HttpResponse

def add(request):
    a = request.GET.get('a', 0)
    b = request.GET.get('b', 0)
    c = int(a) + int(b)
    return HttpResponse(str(c))
	
# urls.py文件添加 url(r'^add/', calc_views.add, name='add')
# 127.0.0.1:8080/add/?a=3&b=4 传递a，b的值

def add2(request, a, b):
    c = int(a) + int(b)
    return HttpResponse(str(c))
	
# 加 url(r'^add/(\d+)/(\d+)/$', calc_views.add2, name='add2')
# 127.0.0.1:8080/add/3/4 
	
```
