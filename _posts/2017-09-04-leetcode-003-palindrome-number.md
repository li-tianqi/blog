---
layout: post
title: LeetCode 003--Palindrome Number
categories: [LeetCode]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## LeetCode 003: Palindrome Number 
### 问题描述  

> **9. Palindrome Number**  
> 
> Determine whether an integer is a palindrome. Do this without extra space.  
> 
> If you are thinking of converting the integer to string, note the restriction of using extra space.  
> You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow.  

<!--more-->

- 输入：整数
- 要求：判断是否为回文数
- 输出：布尔值

*注：*  
*1. 明确提出不要用转成字符串的方法*  
*2. 使用反转数字的话，注意反转后的整数溢出问题*  
*3. 题目中要求不能使用额外空间*  
*4. 实际上额外空间的要求存在问题，可以理解为恒定O(1)空间*  

---

### 解决方案
#### 思路
最直接的思路就是转成`字符串`后判断，比如  
``` python
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        return (x >= 0 and str(x)[::-1] == str(x)) and True or False
```

不过题目中要求不能用这种方法  
一直考虑的是不能使用`额外空间`，所以始终没思路，后来看了解决方案和讨论，才发现是题目描述有问题  

#### 参考方法
``` python
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x < 0:
            return False
        if x % 10 == 0 and x is not 0:
            return False
        
        rev = 0
        while rev < x:
            rev = rev * 10 + x % 10
            x //= 10
            
        return (x == rev or x == rev // 10) and True or False
```

> - 该方法采用反转的方法，为了避免溢出，只针对一半进行反转，即只反转整数的右半部分，并与左半部分比较，相当于将整数切分成两部分  
> - 比如对于 `2332` ，分为 `23` 和 `32` ,并对后者进行反转  
> - `rev = rev * 10 + x % 10` 获取 `x` 最后一位，放于反转后的 `rev` 最后一位  
> - `x //= 10` 去掉 `x` 最后一位  
> - 直到切出一半的位数为止  
> 
> **判断是否为一半的方法**  
> - 对于回文数，切出一半之前，`rev` 比 `x` 位数少，一定满足 `rev < x`, 切出一半（奇数位为一多半）时，满足 `rev == x` (奇数位时为 `rev = x // 10` )  
> - 对于非回文数，不会出现两者相等的情况，所以不管是一半还是一多半，只要 `rev` 比 `x` 大就可以停止切分了(切一部分只是为了防止溢出)  
> - 时间复杂度为*O(log<sub>10</sub>n)*, 因为每次迭代将输入除以10，
> - 空间复杂度为*O(1)*

根据这一思路写完，提交时发现对于尾数是 `0` 的情况无法正确识别，因为尾数为 `0` 无法正常切分  
比如对于 `1210` , 切分结果为：  
- s1 -> rev = 0,  x = 121  
- s2 -> rev = 1,  x = 12  
- s3 -> rev = 12, x = 1  

满足 `rev = x // 10`, 判断为 `True`, 但显然 `1210` 不是回文数  
所以要单独考虑尾数为 `0` 的情况，其中当 `x = 0` 时是特例  

