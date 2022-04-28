---
title: Markdown高级特性
toc: true
date: 2022-04-28 23:59:05
updated:
sticky:
tags:
  - Markdown
categories:
  - Tutorial
keywords:
description: 高级特性：数学公式、流程图、ToDo List、序列图、甘特图
top_img:
comments:
cover:
toc_number:
toc_style_simple:
copyright:
copyright_author:
copyright_author_href:
copyright_url:
copyright_info:
mathjax:
katex:
aplayer:
highlight_shrink:
aside:
---
# 高级语法
## 数学公式
1. 行内公式 \$公式\$
2. 行间公式 \$$公式\$$  

符号速查可参考[Markdown数学符号速查表](https://www.cnblogs.com/mengsuenyan/p/12614058.html)

## 流程图
``` markdown
st=>start: 开始
op1=>operation: 操作
c=>condition: 是 or 否
e=>end: 结束

st->op1->c
c(yes)->e
c(no)->op1
```
效果如下  
``` flow
st=>start: 开始
op1=>operation: 操作
c=>condition: 是 or 否
e=>end: 结束

st->op1->c
c(yes)->e
c(no)->op1
```
## ToDo List
```markdown
- [] 未处理1
- [] 未处理2
- [x] 已处理1
- [x] 已处理1
```
- [] 未处理1
- [] 未处理2
- [x] 已处理1
- [x] 已处理1

  
  
## 序列图
```seq
A->B: hello?
Note right of B: B thinks
B->A: hello!
```  

## 甘特图
```gantt         
       dateFormat  YYYY-MM-DD   
       title 使用mermaid语言定制甘特图
       section 任务1
       已完成的任务           :done,    des1, 2014-01-06,2014-01-08
       正在进行的任务               :active,  des2, 2014-01-09, 3d
       待完成任务1               :         des3, after des2, 5d
       待完成任务2              :         des4, after des3, 5d
```