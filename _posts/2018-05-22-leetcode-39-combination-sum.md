---
layout: post
title: LeetCode 39 & 40--Combination Sum
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 39 & 40: Combination Sum

### Combination Sum I

> Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
>
> The same repeated number may be chosen from candidates unlimited number of times.
>
> All numbers (including target) will be positive integers.
> The solution set must not contain duplicate combinations.

<https://leetcode.com/problems/combination-sum/description/>

<!--more-->

```python
class Solution:
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        rt = []
        candidates = sorted(candidates)
        def helper(target, solution, start):
            # 用start之前的候选值的情况已经判断过了才会到start, 所以从start开始
            for i in range(start, len(candidates)):
                # 由于升序排列, 当前候选值超过或等于目标值, 则后续其他值必然不会再满足, 
                # 所以这两种情况可终止循环, 直接返回
                if target - candidates[i] == 0:
                    # solution不用append是因为在后面的 i 的情况还要用当前的solution呢
                    rt.append(solution + [candidates[i]])
                    return
                elif target - candidates[i] < 0:
                    return
                else:
                    # 加上当前候选值后不足目标值, 表明需继续寻找
                    helper(target-candidates[i], solution+[candidates[i]], i)
                 
        helper(target, [], 0)
        return rt
```

### Combination Sum II

> Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
>
> Each number in candidates may only be used once in the combination.

<https://leetcode.com/problems/combination-sum-ii/description/>

```python
class Solution:
    def combinationSum2(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        rt = []
        candidates = sorted(candidates)
        
        def helper(target, solution, start):
            for i in range(start, len(candidates)):
                if i-1 >= start and candidates[i] == candidates[i-1]:
                    # 避免考察重复元素
                    continue
                if target - candidates[i] == 0:
                    #if solution + [candidates[i]] not in rt:
                    # 开始用的这种方法避免重复, 后改为上面判断方法
                    # 从73.39%提升到99.27%
                    rt.append(solution + [candidates[i]])
                    return
                elif target - candidates[i] < 0:
                    return
                else:
                    # 与Combination Sum I 主要区别在这
                    helper(target-candidates[i], solution+[candidates[i]], i+1)
                    
        helper(target, [], 0)
        
        return rt
```