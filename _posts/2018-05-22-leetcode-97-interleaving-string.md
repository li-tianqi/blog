---
layout: post
title: LeetCode 97--Interleaving String
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode: Interleaving String

> Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

<https://leetcode.com/problems/interleaving-string/description/>

<!--more-->

```python
class Solution:
    def isInterleave(self, s1, s2, s3):
        """
        :type s1: str
        :type s2: str
        :type s3: str
        :rtype: bool
        """
        m = len(s1)
        n = len(s2)
        L = len(s3)
        if m+n != L:
            return False
        # DP, s1[:i]与s2[:j]是否正确构成s3[:i+j]
        arr = [[False] * (n+1) for _ in range(m+1)]
        arr[0][0] = True	# ''与''构成''
        # 第0列与第0行
        for i in range(1, m+1):
            if s1[i-1] == s3[i-1] and arr[i-1][0]:
                arr[i][0] = True
        for j in range(1, n+1):
            if s2[j-1] == s3[j-1] and arr[0][j-1]:
                arr[0][j] = True
        
        for i in range(1, m+1):
            for j in range(1, n+1):
                # 若从s1新增(s1[i-1]), 则s2[j-1]必须在之前已经有了着落(arr[*][j]==True)
                # 反之亦然, 否则无法构成s3
                if (s1[i-1] == s3[i+j-1] and arr[i-1][j]) or \\
                	(s2[j-1] == s3[i+j-1] and arr[i][j-1]):
                    arr[i][j] = True 
        return arr[-1][-1]
```



