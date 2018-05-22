---
layout: post
title: LeetCode 39: Combination Sum
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 39: Combination Sum

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

