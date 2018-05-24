---
layout: post
title: LeetCode 62 & 63--Unique Paths
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 62 & 63: Unique Paths

### Unique Paths I

> A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
>
> The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
>
> How many possible unique paths are there?

<https://leetcode.com/problems/unique-paths/description/>

<!--more-->

```python
class Solution:
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        # 即求组合C(m+n-2, n-1)
        p = m+n-2
        q = n-1
        U = 1
        D = 1
        for i in range(1, q+1):
            U *= p
            D *= i
            p -= 1
            
        return U//D
```

### Unique Paths II

> A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
>
> The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
>
> Now consider if some obstacles are added to the grids. How many unique paths would there be?
>
> An obstacle and empty space is marked as 1 and 0 respectively in the grid

<https://leetcode.com/problems/unique-paths-ii/description/>

```python
class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid):
        """
        :type obstacleGrid: List[List[int]]
        :rtype: int
        """
        # DP
        R = len(obstacleGrid)
        C = len(obstacleGrid[0])
        
        arr = [[0] * C for _ in range(R)]
        if obstacleGrid[0][0] == 0:
            arr[0][0] = 1
        else:
            arr[0][0] = 0
        for i in range(1, R):
            if obstacleGrid[i][0] == 0:
                arr[i][0] = arr[i-1][0]
            else:
                arr[i][0] = 0
        for j in range(1, C):
            if obstacleGrid[0][j] == 0:
                arr[0][j] = arr[0][j-1]
            else:
                arr[0][j] = 0
        for i in range(1, R):
            for j in range(1, C):
                if obstacleGrid[i][j] == 0:
                    # 或从上面过来, 或从左面过来
                    arr[i][j] = arr[i-1][j] + arr[i][j-1]
                else:
                    arr[i][j] = 0
        return arr[-1][-1]
```

