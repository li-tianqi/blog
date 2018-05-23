---
layout: post
title: LeetCode 54--Spiral Matrix
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 54: Spiral Matrix

> Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

<https://leetcode.com/problems/spiral-matrix/description/>

<!--more-->

```python
class Solution:
    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """
        if not matrix:
            return matrix
        rt = []
        cur_pos = (0, -1)
        row_steps = len(matrix[0])
        col_steps = len(matrix) - 1
        
        def right(cur_pos, row_steps):
            i, j = cur_pos
            for _ in range(row_steps):
                j += 1
                rt.append(matrix[i][j])
            return (i, j), row_steps-1
        
        def down(cur_pos, col_steps):
            i, j = cur_pos
            for _ in range(col_steps):
                i += 1
                rt.append(matrix[i][j])
            return (i, j), col_steps-1
        
        def left(cur_pos, row_steps):
            i, j = cur_pos
            for _ in range(row_steps):
                j -= 1
                rt.append(matrix[i][j])
            return (i, j), row_steps-1
        
        def up(cur_pos, col_steps):
            i, j = cur_pos
            for _ in range(col_steps):
                i -= 1
                rt.append(matrix[i][j])
            return (i, j), col_steps-1
        
        while True:
            if row_steps > 0:
                cur_pos, row_steps = right(cur_pos, row_steps)
            else:
                break
            if col_steps > 0:
                cur_pos, col_steps = down(cur_pos, col_steps)
            else:
                break
            if row_steps > 0:
                cur_pos, row_steps = left(cur_pos, row_steps)
            else:
                break
            if col_steps > 0:
                cur_pos, col_steps = up(cur_pos, col_steps)
            else:
                break
            
        return rt
```

