---
layout: post
title: LeetCode 005--Longest Common Prefix
categories: [LeetCode]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## LeetCode 005: Longest Common Prefix

### 问题描述

> **14. Longest Common Prefix**  
>
> Write a function to find the longest common prefix string amongst an array of strings.

<!--more-->

- 输入：字符串数组
- 要求：寻找数组中字符串的最长公共前缀
- 输出：字符串

*注：注意数组为 `空` ，和数组中某一字符串为 `""` 的情况，我因为这个问题没注意提交错误了两次*  

---

### 解决方案
#### 思路
从头到尾遍历数组，两两比较字符串相同的部分，最终得到公共前缀  
```python
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        n = len(strs)
        if n == 0:
            return ''
        
        s = strs[0]
        for i in range(1,n):
            len_i = len(strs[i])
            len_s = len(s)
            if len_i == 0 or len_s == 0:
                return ''
            k = len_i < len_s and len_i or len_s
            tmp = ''
            for j in range(k):
                if s[j] == strs[i][j]:
                    tmp += s[j]
                else:
                    break
                    
            s = tmp
            if s == '':
                break
                
        return s 
```

后续补充更好的解决方案
