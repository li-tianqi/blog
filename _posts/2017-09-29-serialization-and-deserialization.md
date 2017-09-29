---
layout: post
title: python的序列化和反序列化
categories: [Python]
tags: [python3]
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## python的序列化和反序列化 

### 概念 

序列化(Serialization): 将对象状态存储为另一种通用格式, 比如二进制, xml, json等. 

反序列化(deserialization): 将对应格式再转换回来构建成对象. 

<!--more-->

### 使用情况 

a）当你想把的内存中的对象保存到一个文件中或者[数据库](https://www.2cto.com/database/)中时候；
b）当你想用套接字在网络上传送对象的时候；
c）当你想通过RMI传输对象的时候；

### python实现

python常用的序列化模块有两个: `pickle`和`json`, 其中`pickle`是将对象存储为`二进制`, 而`json`是将对象存储为`字符串`, 相对有更好的可读性和跨平台性. 

##### json模块

##### 将对象序列化为字符串 

用到的方法是`dumps(obj)` 和`loads(str)`, 举例如下:

```python
import json

dic = {'age':23, 'job': 'student'}

# 序列化
dic_str = json.dumps(dic)
print(type(dic_str), dic_str)

# 反序列化 
dic_obj = json.loads(dic_str)
print(type(dic_obj), dic_obj)
```

输出>>: 

```
<class 'str'> {"age": 23, "job": "student"}
<class 'dict'> {'age': 23, 'job': 'student'}
```

`dumps`将对象转换成了字符串, `loads`又将字符串恢复成了dict对象

##### 存储为json文件 

将对象存储为json文件也很常用, 用到的方法是`dump(obj)`和`load(str)`, (*注意和上面的区别, 上面的多了 `s`*), 例如: 

```python
import json

dic = {'age':23, 'job': 'student'}

# 序列化
with open('test.json', 'w', encoding='utf-8') as f:
    json.dump(dic, f)
# 生成json文件
    
# 反序列化
with open('test.json', encoding='utf-8') as f:
    obj = json.load(f)
    print(type(obj), obj)
```

输出>>: 

```
<class 'dict'> {'job': 'student', 'age': 23}
```

##### 存储自定义对象

直接用`dump`序列化会报错, 因为`dump`需要一个参数`default`, 这个参数接收一个函数, 将对象转化为字典, 对象`object`有自身的`__dict__`方法, 所以序列化过程可以如下:

```python
class Person:
    def __init__(self, name, age, job):
        self.name = name
        self.age = age
        self.job = job

    def work(self):
        print(self.name, 'is working...')

aa = Person('Bob', 23, 'Student')

with open('abc.json', 'w', encoding='utf-8') as f:
   json.dump(aa, f, default=lambda obj: obj.__dict__)
```

也可以自己写转换函数, 比如:

```python
def person2dict(person):
    return {'name': person.name,
            'age': person.age,
            'job': person.job}
  
with open('abc.json', 'w', encoding='utf-8') as f:
    json.dump(aa, f, default=person2dict)
```

对于反序列化, 也需要一个参数`object_hook`, 将字典转为对象

```python
def dict2person(dic):
    return Person(dic['name'], dic['age'], dic['job'])
  
with open('abc.json', encoding='utf-8') as f:
    obj = json.load(f, object_hook=dict2person)
```

用json模块实现, 需要手动实现`object_hook`参数, 并且不能序列化类. 

#### pickle模块

用法与json差不多

由于**pickle写入的是二进制数据**，所以打开方式需要以`wb`和`rb`的模式

```python
import pickle

dic = {'age': 23, 'job': 'student'}

##############################################
# 存储在变量中
# 序列化
byte_data = pickle.dumps(dic)
print(byte_data)
# 输出 b'\x80\x03}q\x00(X\x03\x00\x00\...'

# 反序列化
obj = pickle.loads(byte_data)
print(obj)
# 输出 {'age': 23, 'job': 'student'}

################################################
# 存储在文件中
# 序列化
with open('abc.pkl', 'wb') as f:
    dic = {'age': 23, 'job': 'student'}
    pickle.dump(dic, f)
# 反序列化
with open('abc.pkl', 'rb') as f:
    aa = pickle.load(f)
    print(aa)
    print(type(aa))
    
################################################
# 序列化自定义对象(可以序列化类)
class Person:
    def __init__(self, name, age, job):
        self.name = name
        self.age = age
        self.job = job

    def work(self):
        print(self.name, 'is working...')
        
# 将实例存储在变量中，当然也能存在文件中
a_person = Person('abc', 22, 'waiter')
person_abc = pickle.dumps(a_person)
p = pickle.loads(person_abc)
p.work()

# 将类本身存储在变量中，loads的时候返回类本身，而非它的一个实例
class_Person = pickle.dumps(Person)
Person = pickle.loads(class_Person)
p = Person('Bob', 23, 'Student')
p.work()

# 将类存储在文件中
# 序列化
with open('person.pkl', 'wb') as f:
    pickle.dump(Person, f)

# 反序列化
with open('person.pkl', 'rb') as f:
    Person = pickle.load(f)
    aa = Person('gg', 23, '6')
    aa.work()
```

优点是不用实现额外的函数, 可以序列化`类`; 缺点是该模块为python特有, 不便于和其他语言之间交互. 

