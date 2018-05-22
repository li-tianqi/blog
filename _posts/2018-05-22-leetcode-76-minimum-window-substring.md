---
layout: post
title: LeetCode 76--Minimum Window Substring
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 76: Minimum Window Substring 

> Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n). 

<https://leetcode.com/problems/minimum-window-substring/description/>

<!--more-->

```python
class Solution:
    def minWindow(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: str
        """
        dic = {}
        for i in t:
            dic[i] = dic.get(i, 0) + 1
            
        count = 0	# 窗中包含目标字符计数
        start = -1	# 初始最小窗左侧
        end = -1	# 初始最小窗右侧
        j = 0	 	# 当前窗左侧
        for i, c in enumerate(s):
            if c in dic:
                dic[c] -= 1		# 更新目标字符计数
                if dic[c] >= 0:		# 是否需更新count
                    count += 1
                    
                    if count == len(t):		# 窗中包含了全部目标字符
                        while True:			# 移动窗左侧, 缩小窗
                            if s[j] not in dic:		# 非目标字符, 右移
                                j += 1
                            elif dic[s[j]] < 0:		# 重复的目标字符, 右移, 并更新计数map
                                dic[s[j]] += 1		# 注意两者更新顺序
                                j += 1
                            else:				# 缩减窗口完毕
                                break
                        if start == -1 or i - j < end - start:	# 是否更小
                            start, end = j, i
                            
                        dic[s[j]] += 1		# 窗左侧右移一格, 同时更新map与计数, 注意顺序
                        j += 1
                        count -= 1
        return s[start:end+1]
```



