---
layout: post
title: Manacher Algorithm
categories: [Python]
tags: []
mermaid: false
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex, Machine Learning, Network, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ML, ]-->

<!--mermaid endmermaid-->

<!--## title-->
## Manacher Algorithm
<!--more-->
``` python
def manacher(s):
    if len(s) <= 1:
        return s
    
    ma = '$' + '$'.join(s) + '$'
    p = [0] * len(ma)
    p[0] = 1
    p[1] = 2
    mx = 2
    id = 1
    max_p = 2
    max_id = 1
    for i in range(2, len(ma)):
        p[i] = min(p[2*id-i], mx-i) if mx > i else 1
        l = i - p[i]
        r = i + p[i]
        while l >= 0 and r < len(ma) and ma[l] == ma[r]:
            p[i] += 1
            l -= 1
            r += 1
        if i + p[i] - 1 > mx:
            mx = i + p[i] - 1
            id = i
        if p[i] > max_p:
            max_p = p[i]
            max_id = i
    
    return ma[max_id - max_p + 1 + 1 : max_id + max_p - 1 : 2]
```
