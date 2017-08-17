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
> urls.py  
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
> 
> 除了这些，还有以上目录中未提及的：  
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

#### 9. 添加模板文件
**views.py添加home方法**  
``` python
def home(request):
    return render(request, 'home.html')
```

**在对应app目录建立templates文件夹并添加home.html文件**  

**配置路由**  
``` python
url(r'^home/', Hello_views.home, name='home'),
```

**测试**  
> 127.0.0.1:8080/home

**提示找不到模板**
> 在settings中加上  

``` python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
```

**再次测试提示警告**
> WARNINGS:
?: (1_8.W001) The standalone TEMPLATE_* settings were deprecated in Django 1.8 and the TEMPLATES dictionary takes precedence. You must put the values of the following settings into your default TEMPLATES dict: TEMPLATE_DEBUG.

在settings中将TEMPLATE_开头的项都移到TEMPLATES中
``` python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
			'debug': DEBUG, # 如这行
        },
    },
]
```

#### 10. 模型与数据库
**在模型中定义数据库结构**  
app目录下的models.py  
``` python
from django.db import models

class Person(models.Model):
    name = models.CharField(max_length=30)
    age = models.IntegerField()
	
	def __str__(self):  # 该方法用于查询数据库时返回具体表项
        return self.name
		
	# 定义Person类，继承自models.Model
```

**执行同步数据库操作**  
```
$ python3 manage.py makemigrations
$ python3 manage.py migrate
# 这里用默认的sqlites数据库，无需其他操作
```

**使用数据库测试**  
```
$ python3 manage.py shell
>>> from Hello.models import Person
>>> Person.objects.create(name="LI", age=23)
<Person: Person object>

>>> Person.objects.get(name="LI")
<Person: Person object>  # 此为不加__str__方法时的返回结果

>>> Person.objects.get(name="LI")
<Person: LI>  # 此为加了__str__方法时的返回结果
```

**其他操作**  
```
# 增操作
# 1
Person.objects.create(name = name, age = age)

# 2
p = Person(name = name, age = age)
p.save()

# 3
p = Person(name = name)
p.age = age
p.save()

# 4 
Person.objects.get_or_create(name = name, age = age)
# 该方法用于防止重复，返回元祖，第一个是Person对象，第二个是布尔值，新建为True，已存在为False


# 查操作
Person.objects.all()

# 2. 切片操作，获取10个人，不支持负索引，切片可以节约内存
Person.objects.all()[:10]

# 3
Person.objects.get(name = name)

# 4. get是用来获取一个对象的，如果需要获取满足条件的一些人，就要用到 filter
Person.objects.filter(name = "abc")

# 5. 名称为 abc 但是不区分大小写，可以找到 ABC, Abc, aBC，这些都符合条件
Person.objects.filter(name__iexact = "abc")

# 6. 名称中包含 "abc"的人
Person.objects.filter(name__contains = "abc")

# 7. 名称中包含 "abc"，且abc不区分大小写
Person.objects.filter(name__icontains = "abc")

# 8. 正则表达式查询
Person.objects.filter(name__regex = "^abc")

# 9. 正则表达式不区分大小写
Person.objects.filter(name__iregex = "^abc")

# 10. 排除包含 WZ 的Person对象
Person.objects.exclude(name__contains = "WZ")

# 11. 找出名称含有abc, 但是排除年龄是23岁的
Person.objects.filter(name__contains="abc").exclude(age = 23)
```

**总结使用数据库的方法**  
- 在app对应的models.py中建立相应的表项类
- 同步数据库
- 对数据库操作


#### 11. 表单
**GET方法提交表单**  
*实现计算a+b和*  
在对应app下添加模板index.html文件  
``` html
<!DOCTYPE html>
<html>
<body>
<p>Please input 2 numbers:</p>

<form action="/add/" method="get">
    a: <input type="text" name="a"> <br>
    b: <input type="text" name="b"> <br>
	<!--name属性用于将网页中的值传递给服务器-->

    <input type="submit" value="submit">
</form>

</body>
</html>
```

views.py
``` python
from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return render(request, 'index.html')

def add(request):
    a = request.GET.get('a', None)
    b = request.GET.get('b', None)
	# 这里的'a'就是上面的name标签
	
    a = int(a)
    b = int(b)
    return HttpResponse(str(a+b))
```

urls.py
``` python
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^index/', learn_views.index),
	# 表单页面
    url(r'^add/$', learn_views.add, name='add'),
	# 提交后的结果页面
```

**POST方式提交表单**  
在对应app目录下新建forms.py  
``` python
from django import forms

class AddForm(forms.Form):
    a = forms.IntegerField()
    b = forms.IntegerField()
```

views.py
``` python
from .forms import AddForm

def index(request):
    if request.method == 'POST':
        # 当表单以 POST 方式提交的时候
        form = AddForm(request.POST)
        if form.is_valid():
            # 如果提交的数据合法
            a = form.cleaned_data['a']
            b = form.cleaned_data['b']
			# cleaned_data用于读取表单返回值
            return HttpResponse(str(int(a) + int(b)))
    else:
        # 正常方位时
        form = AddForm()

    return render(request, 'index.html', {'form': form})
```  

index.html  
{% highlight html linenos %}

<!DOCTYPE html>
<html>
<body>
<p>Please Input 2 numbers:</p>
<form method='post'>
    { % csrf_token % }
    { { form } }
    <input type="submit" value="submit">
</form>
</body>
</html>

{% endhighlight %}

urls.py
``` python
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', calc_views.index, name='home'),
]
```