---
layout: post
title: LeetCode 002--Reverse Integer
categories: [LeetCode]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## LeetCode 002: Reverse Integer 
### 问题描述  

> **7. Reverse Integer**  
> 
> Reverse digits of an integer.
> ```
> Example1: x = 123, return 321
> Example2: x = -123, return -321
> ```

<!--more-->

- 输入：整数
- 要求：反转
- 输出：整数

*注：*  
*1. 注意输入的整数末尾是`0`的情况，比如`10100`*  
*2. 注意反转后的整数溢出问题*  
*3. 假设输入为`32位`有符号数，反转后溢出时返回`0`*  

---

### 解决方案
#### 思路
将绝对值转成字符串，对字符串反转，在转回`int`, 判断是否溢出.  
*注：python中int实际上并没有限定范围*  

``` python
class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        # 32位带符号整数的范围
        num_min = -(2 ** 31)
        num_max = 2 ** 31 -1
        
        if x > num_max or x < num_min:
            return 0
        else:
            tmp = int(str(abs(x))[::-1])
            reversed_num = x<0 and -tmp or tmp    # expr and a or b 相当于C语言中的 expr ? a : b
            return (reversed_num <= num_max and reversed_num >= num_min) and reversed_num or 0
```

这种方法的运行时间是`52ms`, python实现的最快的是`38ms`

#### 更快的方法
``` python
class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        
        (s, x) = (-1, -x) if x < 0 else (1, x)
        rev = 0
        while x > 0:
            rev = rev * 10 + x % 10
            x //= 10    # 结果是商的整数部分
            if rev > 2**31 or rev < -2**31: return 0
        return rev*s
```

`x % 10`得到`x`的最右一位，`x //= 10`去掉最后一位, 每次循环结果相当于是把`x`的最后一位拿到`rev`的最后一位, 快的原因可能是每次循环只做简单的算术运算.

