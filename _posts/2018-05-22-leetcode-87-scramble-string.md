---
layout: post
title: LeetCode 87--Scramble String
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 87: Scramble String

> Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1. 

<https://leetcode.com/problems/scramble-string/description/>

<!--more-->

```python
class Solution:
    def isScramble(self, s1, s2):
        """
        :type s1: str
        :type s2: str
        :rtype: bool
        """
        def helper(s1, s2):
            if len(s1) != len(s2):
                return False
            if s1 == s2:
                return True
            if sorted(s1) != sorted(s2):	# 剪枝
                return False
            
            for i in range(1, len(s1)):		# 遍历分割点
                # 分别判断不交换与交换的情况
                if (helper(s1[:i], s2[:i]) and helper(s1[i:], s2[i:])) or \\
                	(helper(s1[:i], s2[-i:]) and helper(s1[i:], s2[:-i])):
                    return True
                
            return False
            
        return helper(s1, s2)
```

