---
layout: post
title: LeetCode 56--Merge Intervals
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 56: Merge Intervals

> Given a collection of intervals, merge all overlapping intervals.
>
> Input: [[1,3],[2,6],[8,10],[15,18]]
> Output: [[1,6],[8,10],[15,18]]
> Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

<https://leetcode.com/problems/merge-intervals/description/>

<!--more-->

```python
# Definition for an interval.
# class Interval:
#     def __init__(self, s=0, e=0):
#         self.start = s
#         self.end = e

class Solution:
    def merge(self, intervals):
        """
        :type intervals: List[Interval]
        :rtype: List[Interval]
        """
        if len(intervals) <= 1:
            return intervals
        intervals = sorted(intervals, key=lambda x: x.start)
        
        cur = intervals[0]
        rt = [cur]
        for i in range(1, len(intervals)):
            tmp = intervals[i]
            if tmp.start <= cur.end:
                cur.end = max(cur.end, tmp.end)
            else:
                rt.append(tmp)
                cur = tmp
                
        return rt
```

