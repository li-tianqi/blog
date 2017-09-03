---
layout: post
title: LeetCode 001--Two Sum
categories: [LeetCode]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## LeetCode 001: Two Sum  
### 问题描述  
 
> **1. Two Sum**  
> 
> Given an array of integers, return indices of the two numbers such that they add up to a specific target.   
> You may assume that each input would have exactly one solution, and you may not use the same element twice.  
> 
> **Example:**  
> ```
> Given nums = [2, 7, 11, 15], target = 9,
> 
> Because nums[0] + nums[1] = 2 + 7 = 9,
> return [0, 1].
> ```

<!--more-->

* 输入：一个整形数组，一个整数  
* 要求：在整形数组中找到两个数，使其和等于目标整数  
* 输出：两个数的下标索引值  

*注：*  
*1. 假设每个输入有且仅有唯一正确结果*  
*2. 相同的数组元素不能使用两次（指索引相同）*  

---

### 解决方案
#### 最初的思路
通过索引嵌套遍历数组，如果两个数相加等于目标整数，返回两个索引值  
``` python 
class Solution:
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for i in range(len(nums)):
            for j in range(len(nums)):
                if i != j and nums[i] + nums[j] == target:
                    return [i, j]
```

提交时出现`Time Limit Exceeded`，原因是嵌套的两次遍历，时间复杂度为*O(n<sup>2</sup>)*，而且两次遍历都是从头开始的，而实际上第二次遍历从剩下的部分查找就好，所以也增加了不必要的查询时间消耗。  

#### 改进后的思路
遍历数组，判断目标值与遍历值的差是否在数组的剩余部分，如果在，提取索引值并返回  
```python
class Solution:
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for j in reversed(range(len(nums))):
            if target - nums[j] in nums and j != nums.index(target-nums[j]):
                return [nums.index(target-nums[j]), j]
```

这里从反向遍历，并从正向查找，避免了多余的查询，虽然提交通过，但list的查找复杂度为*O(n)*，所以总的时间复杂度仍然是*O(n<sup>2</suo>)*

#### 更优秀的方法
因为用的python，所以重点看了discuss里python的方法。  

``` python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        map={}
        for i in range(len(nums)):
            complement=target-nums[i]
            if complement in map.keys():    # dict.keys()返回所以可用键的列表
                return [map.get(complement),i]    # dict['key']只能获取存在的值，不存在会触发KeyError, 而dict.get(key, default=None)如果不存在则返回一个默认值(可设置)
            map[nums[i]]=i
        raise ValueError("There is no two numbers that they add up to this target")
```

这里循环内的查找是针对dict的，复杂度为*O(1)*，所以总的复杂度为*O(n)*
