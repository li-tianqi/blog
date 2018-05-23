---
layout: post
title: LeetCode 48--Rotate Image
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 48: Rotate Image

> You are given an n x n 2D matrix representing an image.
>
> Rotate the image by 90 degrees (clockwise).
>
> You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

<https://leetcode.com/problems/rotate-image/description/>

<!--more-->

```python
class Solution:
    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        N = len(matrix)
        if N <= 1:
            return
        # 沿对角线对换
        for i in range(N-1):
            for j in range(i+1, N):
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
                
        # 左右对换
        for i in range(N):
            for j in range(N//2):
                matrix[i][j], matrix[i][-(j+1)] = matrix[i][-(j+1)], matrix[i][j]
```

