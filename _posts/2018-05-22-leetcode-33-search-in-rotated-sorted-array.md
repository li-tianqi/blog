---
layout: post
title: LeetCoed 33--Search in Rotated Sorted Array
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 33: Search in Rotated Sorted Array

> Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
>
> (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
>
> You are given a target value to search. If found in the array return its index, otherwise return -1.
>
> You may assume no duplicate exists in the array.
>
> Your algorithm's runtime complexity must be in the order of O(log n).

<https://leetcode.com/problems/search-in-rotated-sorted-array/description/>

<!--more-->

```python
class Solution:
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        # O(logn) 二分法
        start = 0
        end = len(nums)-1
        
        while end >= start:
            mid = (end + start) // 2
            if nums[mid] == target:
                return mid
            
            if nums[mid] >= nums[start]:    # 左增
                if nums[start] <= target < nums[mid]:
                    end = mid - 1
                else:
                    start = mid + 1
            else:       # 右增
                if nums[mid] < target <= nums[end]:
                    start = mid + 1
                else:
                    end = mid - 1
                
        return -1
```

