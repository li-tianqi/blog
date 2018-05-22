---
layout: post
title: LeetCode 34--Search for a Range
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 34: Search for a Range

> Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
>
> Your algorithm's runtime complexity must be in the order of O(log n).
>
> If the target is not found in the array, return [-1, -1].

<https://leetcode.com/problems/search-for-a-range/description/>

<!--more-->

```python
class Solution:
    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        start = 0
        end = len(nums) - 1
        pos = None
        while end >= start:
            mid = (start + end) // 2
            if nums[mid] == target:
                pos = mid
                break
            elif nums[mid] > target:
                end = mid - 1
            else:
                start = mid + 1

        if pos == None:
            return [-1, -1]
        else:
            i = pos
            while i-1 >= 0 and nums[i-1] == target:
                i -= 1
            j = pos
            while j+1 < len(nums) and nums[j+1] == target:
                j += 1
            return [i, j]
```

