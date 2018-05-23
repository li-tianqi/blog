---
layout: post
title: LeetCode 45 & 55--Jump Game
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 45 & 55: Jump Game

### Jump Game I

> Given an array of non-negative integers, you are initially positioned at the first index of the array.
>
> Each element in the array represents your maximum jump length at that position.
>
> Determine if you are able to reach the last index.

<https://leetcode.com/problems/jump-game/description/>

<!--more-->

```python
class Solution:
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        L = len(nums) - 1
        far = -1
        for i, num in enumerate(nums):
            far = max(far, i+num)
            if far >= L:	# 最远终点
                return True
            elif num == 0 and far <= i:		# 无法越过该0位置
                return False
```

### Jump Game II

> Given an array of non-negative integers, you are initially positioned at the first index of the array.
>
> Each element in the array represents your maximum jump length at that position.
>
> Your goal is to reach the last index in the minimum number of jumps.

<https://leetcode.com/problems/jump-game-ii/description/>

```python
class Solution:
    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if len(nums) <= 1:
            return 0
	
        def helper(steps=0, close=0, far=0):
            # 经过steps步, 最远到far, close为比少一步时最远位置多一的位置
            while far < len(nums) - 1:
                tmp = far + 1
                for i in range(far, close-1, -1):
                    dis = i + nums[i]
                    if dis >= len(nums)-1:	# 满足, 返回
                        return steps + 1
                    if dis > tmp:	# 更新far
                        tmp = dis

                steps += 1
                close = far+1
                far = tmp
            return steps
        
        return helper()
```

