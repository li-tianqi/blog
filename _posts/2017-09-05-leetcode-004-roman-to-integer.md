---
layout: post
title: LeetCode 004--Roman to Integer
categories: [LeetCode]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## LeetCode 004: Roman to Integer

### 问题描述

> **13. Roman to Integer**  
>
> Given a roman numeral, convert it to an integer.
>
> Input is guaranteed to be within the range from 1 to 3999.

<!--more-->

- 输入：字符串
- 要求：将罗马数字转换为整数
- 输出：整数

*注：输入数字范围为`1-3999`(为了确保不会出现用上横线表示1000倍的情况)*  

---

### 罗马数字介绍  

要解决`罗马数字转为整数`的问题，首先要明确<a href="https://baike.baidu.com/item/罗马数字" target="_blank">罗马数字</a>的规则   

#### 记数方法

罗马数字中有7个基本字符，如下表：  

| 基本字符    |  I   |  V   |  X   |  L   |  C   |  D   |  M   |
| :------ | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
| 对应阿拉伯数字 |  1   |  5   |  10  |  50  | 100  | 500  | 1000 |

以基本字符的排列表示数字，比如 `IV=4`, `MCMLXXVI=1976`, 具体规则如下  

#### 组数规则

1. 相同数字连写，表示的数等于这些数字相加的和，比如 `III=3`，`XX=20`  

2. 小数字在大数字右边，表示的数等于这些数字相加的和，比如 `XII=12`  

3. 小数字（**仅限`I`, `X`, `C`**）在大数字左边，表示的数等于大数减小数的差，如 `IV=4`, `IX=9` 

4. 在一个数上画一条线，表示将这个数扩大1000倍，如 $\overline{V}$=5000   

#### 限制

- 连写重复数字最多不超过3个
- `I`, `X`, `C`放在大数左边时，最多用一个
- `V`, `L`, `D`放在大数右边时，只能用一个
- `V`, `L`, `D`不能作为小数放左边，用相减的方式

### 解决方案

#### 思路

从右往左依次比较，左边比右边小就用减法，否则就用加法  

```python
class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        dic = {'M':1000, 'D':500, 'C':100, 'L':50, 'X':10, 'V':5, 'I':1}
        num = dic[s[len(s) - 1]]
        for i in reversed(range(1, len(s))):
            num = (dic[s[i-1]] >= dic[s[i]]) and num + dic[s[i -1]] or num - dic[s[i - 1]]
        return num
```

这种效率较低  

``` python
class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        dic = {'M':1000, 'D':500, 'C':100, 'L':50, 'X':10, 'V':5, 'I':1}
        i = len(s) - 1
        num = dic[s[i]]
        while i >= 1:
            a = dic[s[i-1]]
            b = dic[s[i]]
            num = (a >= b) and num + a or num - a
            i -= 1
        return num
```

这种有所提升

