---
layout: post
title: LeetCode 73--Set Matrix Zeroes
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 73: Set Matrix Zeroes

> Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
>
> A straight forward solution using O(mn) space is probably a bad idea.
> A simple improvement uses O(m + n) space, but still not the best solution.
> Could you devise a constant space solution?

<https://leetcode.com/problems/set-matrix-zeroes/description/>

<!--more-->

```python
class Solution:
    def setZeroes(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        if not matrix:
            return
        R = len(matrix)
        C = len(matrix[0])     
        
        def helper(I, J):
            matrix[I][J] = None
            for j in range(C):
                if matrix[I][j] == 0:
                    helper(I, j)	# 换行
                    break	# 后面一定替换完了, 所以break
                else:
                    matrix[I][j] = None
                    
            for i in range(R):
                if matrix[i][J] == 0:
                    helper(i, J)	# 换列
                    break
                else:
                    matrix[i][J] = None
        # 第一轮用None填充0位置
        for i in range(R):
            for j in range(C):
                if matrix[i][j] == 0:
                    # DFS
                    helper(i, j)
                    break
        # 第二轮将None换成0
        for i in range(R):
            for j in range(C):
                if matrix[i][j] == None:
                    matrix[i][j] = 0
```

