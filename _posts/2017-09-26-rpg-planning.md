---
layout: post
title: RPG游戏整体规划
categories: [Game]
tags: 
excerpt_separator: <!--more-->
---

<!--categories: [Ubuntu, Database, Python, Github, Web, Tutorial, Test, Shell, LeetCode, ]-->
<!--tags: [jekyll, python3, github, Django, markdown, mysql, shell, ]-->

## RPG游戏整体规划 

一直以来都有个夙愿，就是自己不使用引擎，从零开始开发一款传统rpg游戏，一方面因为自己喜欢传统单机rpg，另一方面，因为对金老的《射雕英雄传》有一种说不清的情怀，但是以《射雕》为背景的让我满意的游戏却没有一个。面对这么好的rpg素材，一直就不甘心，所以一定要自己完成个“射雕RPG”过过瘾才好。不求画面多么精美，我也没有专业的美工，重点是剧情一定要贴合原著，为了实现这个夙愿，打算着手考虑开发相关事宜。

开始不打算直接针对射雕来，而是先实现一个简单的rpg框架。在动手撸代码之前，先规划一下整体结构，之前没做个类似项目，只能按自己的想法搞了。这个也不是严格的类的结构，只是一个整体规划。

<!--more-->

### 总体结构 

首先，整体分两部分，一部分是`舞台`，另一部分是`仓库`：

```mermaid
graph LR
frame(框架)-->stage(舞台)
frame-->store(仓库)

stage-->scene(场景)
stage-->character(角色)
stage-->collision(碰撞检测)
stage-->painter(渲染)
stage-->switch(场景切换)
stage-->keyevent(按键检测)
stage-->timer(计时器)
stage-->ui(UI)
stage-->fight(战斗系统)

store-->scenelist(场景列表)
store-->eventlist(事件列表)
store-->characterlist(角色列表)
```

仓库用来存放各种实例，就像供等待演出的演员待的后台；舞台是演出展示的地方，每一时刻会有一个场景和一些角色在舞台上表演。所以根据剧情流程将不同的场景和角色载入到舞台即可。另外，舞台还需要有诸如碰撞检测，渲染，切换场景，按键检测，总体计时器等功能，对于像一些系统功能按钮以及展示系统角色等信息的UI界面，暂时放在舞台当中，还有战斗系统，也没想好具体怎么组织，暂时包含在舞台里。初期不打算做功能性UI界面和战斗系统，所以先放一放。

对于`碰撞检测`，可以提供两个对象的位置信息和碰撞条件，返回bool类型的检测结果。

对于`按键监测`，可能需要在不同场景有不同功能，比如战斗，普通，UI等。

### 场景 

场景应该作为一个很重要的部分

```mermaid
graph LR
scene(场景)-->sceneid(场景ID)
scene-->map(地图对象)
map-->mapinformation(地图数据,地图图片,坐标)
scene-->object(物体对象)
object-->objectinformation(覆盖物,障碍物...)
scene-->range(场景范围)
scene-->coordinate(坐标信息)
coordinate-->ci(场景绝对坐标,渲染坐标,图片坐标,主角在场景中的初始位置)
scene-->eventlist(时间对象列表)
scene-->subscene(子场景)
```

`场景ID`作为场景的唯一标识符；

`地图对象`其实也可以属于一种`物体对象`；

`坐标`中绝对坐标作为其他坐标的参照；

`事件对象列表`用来存放当前场景中绑定了事件的对象，用于检测是否在事件触发范围内，也就是检测碰撞是否发生；

`子场景`是该场景中包含的诸如`室内场景`等。

### 物体对象

物体对象可以作为其他对象的基类

```mermaid
graph LR
object(物体对象)-->id(对象ID)
object-->coor(坐标)
object-->pcoor(渲染坐标)
object-->range(渲染范围)
object-->show(显示功能)
object-->event(绑定事件)
object-->son(其他派生属性)
son-->move(移动属性)
move-->speed(移动速度)
move-->movefunc(移动方法)
son-->fight(战斗属性)
fight-->1(精气神...)
fight-->2(攻防速...)
fight-->3(buff,debuff)
```

派生属性主要用于主角，敌人等会动的角色；

buff，defull等可能应该属于战斗系统，待定。

### 事件 

这里事件指的是游戏中发生的事件，比如任务，战斗，说话等，不包括键盘等控制事件（*UI事件可以包括在这，可以把UI定义为一个对象，绑定一个事件*），这里的事件都和对象绑定，可能是NPC对象，地图对象，覆盖物对象，隐身对象等。

```mermaid
graph LR
event(事件)-->id(事件ID)
event-->status(事件状态)
status-->s1(不可触发)
status-->s2(可触发但未触发)
status-->s3(已触发但未完成)
status-->s4(已完成)
event-->occur(发生情况)
occur-->o1(重复)
occur-->o2(周期)
occur-->o3(一次性)
occur-->o4(随机)
event-->way(触发方式)
event-->condition(触发条件)
event-->what(事件内容)
```

在发生情况方面，事件有几种情况：

- 重复：比如NPC说话，物体介绍，场景切换
- 周期：比如NPC有几段话，每次点击说一句，轮流说
- 一次性：比如开宝箱，大部分任务，可触发有限次的也算
- 随机：比如地图遇怪

***对于战斗单独考虑** *

对于触发方式有几种情况：

- 在范围内点空格：比如说话，开宝箱，物体介绍
- 达到地点自动触发：如场景切换，强制剧情，遇怪
- 使用物品触发：如某些需要使用物品的任务

### 总结 

大体规划了一下，暂时就想到这么多，后续可能还会再调整，最好应该再整理一个类的结构。