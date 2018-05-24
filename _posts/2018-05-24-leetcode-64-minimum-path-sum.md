---
layout: post
title: LeetCode 64--Minimum Path Sum
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 64: Minimum Path Sum

> Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

<https://leetcode.com/problems/minimum-path-sum/description/>

<!--more-->

```python
class Solution:
    def minPathSum(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        # DP
        R = len(grid)
        C = len(grid[0])
        arr = [[None]*C for _ in range(R)]
        arr[0][0] = grid[0][0]
        for i in range(1, R):
            arr[i][0] = arr[i-1][0] + grid[i][0]
        for j in range(1, C):
            arr[0][j] = arr[0][j-1] + grid[0][j]
            
        for i in range(1, R):
            for j in range(1, C):
                # 或从上或从左, 找小的
                arr[i][j] = min(arr[i-1][j], arr[i][j-1]) + grid[i][j]
                
        return arr[-1][-1]
```

