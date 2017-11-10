---
layout: post
title: Latex公式语法记录
categories: [Latex]
tags: []
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, Game, Latex]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## Latex公式语法记录

用Typora写公式异常的方便, 而且所见即所得, 包括在word中也支持latex语法, 比自带公式编辑器和mathtype都快得多:

word中用自带公式编辑器: `Alt` + `=` 插入公式, 不用`$` 符号, 直接输入latex语法, `空格` 后显示效果(*支持语法并不全*) 

word中用mathtype: 直接输入由`$$` 包裹的latex公式, 按`Alt`+`\` 生成mathtype公式(*支持语法比较全, 但转换成公式的过程略慢*) 

---

为了方便查看语法, 这里随着使用, 逐步记录常用的Latex公式语法

<!--more-->

更多内容:  <https://zh.wikibooks.org/wiki/LaTeX>

希腊字母: <https://en.wikipedia.org/wiki/Greek_alphabet>

组合运算: $\binom{a}{b}$  

```
$\binom{a}{b}$
```

半边括号加矩阵形式:
$$
\left \{
\begin{matrix} 
a = 0 \\ 
a = 1 
\end{matrix} \right.
$$

```
$\left \{ \begin{matrix} a = 0 \\ a = 1 \end{matrix} \right.$
```

两边下标: $\sideset{_i^j}{_m^n}A$  

```
$\sideset{_i^j}{_m^n}A$
```

分数: $\frac{a}{b}$  

```
$\frac{a}{b}$
```

根号: $\sqrt{a}$ 

```
$\sqrt{}$
```

点: $\cdot$ 

```
$\cdot$
```

叉乘: $\times$ 

```
$\times$
```