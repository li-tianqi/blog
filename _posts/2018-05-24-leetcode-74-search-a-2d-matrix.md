---
layout: post
title: LeetCode 74 & 240--Search a 2D Matrix
categories: [LeetCode]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->

## LeetCode 74 & 240: Search a 2D Matrix

### Search a 2D Matrix

> Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
>
> Integers in each row are sorted from left to right.
> The first integer of each row is greater than the last integer of the previous row.

<https://leetcode.com/problems/search-a-2d-matrix/description/>

<!--more-->

```python
class Solution:
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        # 整体二分查找
        if len(matrix) < 1 or len(matrix[0]) < 1:
            return False
        
        R = len(matrix)
        C = len(matrix[0])
        
        start = 0
        end = R * C - 1
        while start <= end:
            mid = (start+end)//2
            cur = matrix[mid//C][mid%C]		# 序号与行列号的关系
            if cur == target:
                return True
            elif cur > target:
                end = mid - 1
            else:
                start = mid + 1
        return False
```

### Search a 2D Matrix II

> Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
>
> Integers in each row are sorted in ascending from left to right.
> Integers in each column are sorted in ascending from top to bottom.
>
> [
>   [1,   4,   7,   11, 15],
>   [2,   5,   8,   12, 19],
>   [3,   6,   9,   16, 22],
>   [10, 13, 14, 17, 24],
>   [18, 21, 23, 26, 30]
> ]

<https://leetcode.com/problems/search-a-2d-matrix-ii/description/>

```python
class Solution:
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        if len(matrix) < 1 or len(matrix[0]) < 1:
            return False
        
        R = len(matrix)
        C = len(matrix[0])
        
        # 从一角开始, 可从右上依次向左向下找 (大向左, 小向下)
        # 从左下亦可, 小向右, 大向上
        i = 0
        j = C - 1
        while i < R and j >= 0:
            if matrix[i][j] == target:
                return True
            elif matrix[i][j] > target:
                j -= 1
            else:
                i += 1
        return False
            
```

