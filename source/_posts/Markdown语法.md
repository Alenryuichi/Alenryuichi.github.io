---
title: Markdown基本语法（hexo均支持）
toc: true
date: 2022-04-28 22:27:51
updated:
sticky:
tags:
  - Markdown
categories:
  - 博客技术
keywords:
description: 基本语法：标题、段落、区块引用、超链接、图片、有（无）序列表、分隔线、基础字体特效与表格
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
mathjax: false
katex:  false
aplayer:
highlight_shrink:
aside:
---
# 1. 基本语法
## 1.1. 标题 - \#
```markdown
# h1
## h2
### h3
#### h4
```
## 1.2. 段落
Markdown划分段落非常简单，就是在段落前后保留一个空行即可
```markdown
段落一

段落二
```
段落一

段落二
## 1.3. 区块引用 - > 
```markdown
> 引用段落，高亮显示
>                          # 空格
> 嵌套1
>> 嵌套2
>>> 嵌套3
```
> 引用段落，高亮显示
>                          
> 嵌套1
>> 嵌套2
>>> 嵌套3
## 1.4. 超链接 - \[显示文字\]\(超链接\)
```markdown
[超链接显示文字](http://www.baidu.com "超链接title")
```
[超链接显示文字](http://www.baidu.com "超链接title")
## 1.5. 图片 - !\[\]\(\)
```markdown
![百度logo](https://www.baidu.com/img/bd_logo1.png?where=super)
```
## 1.6. 列表 - +,*,-
### 1.6.1. 无序列表
不同符号最高支持到三级列表
```markdown
- 段1
+ 段2
* 段3
  * 段3.1
    * 段3.1.1
      * 段3.1.1.1
```
- 段1
+ 段2
* 段3
  * 段3.1
    * 段3.1.1

   
      
      
### 1.6.2. 有序列表
```markdown
1. 段1
2. 段2
3. 段3
   1. 段3.1
      1. 段3.1.1
```
1. 段1
2. 段2
3. 段3
   1. 段3.1
      1. 段3.1.1      

   



## 1.7. 分隔线 - ***,---
```markdown
***
---
```

***
---
## 1.8. 字体特效
```markdown
*字体1*         斜体
_字体1_         斜体

**字体2**       加粗
__字体2__       加粗

***字体3***     加粗斜体
___字体3___

~~字体4~~       划线
`字体5`         高亮
```

| 斜体 | 加粗 | 加粗斜体 | 划线 | 高亮 |  
| :----: | :----: | :----: | :----: | :----: |  
| *字体1*  | **字体2** | ***字体3***  | ~~字体4~~ | `字体5` |
| _字体1_  | __字体2__ | ___字体3___ |  |  |
## 1.9. 表格
```markdown
| 表头 | 表头 | 表头 |
| :---- | ----: | :----: |    #分别为左对齐、右对齐、居中对齐
| 内容 | 内容 | 内容 |
| 内容 | 内容 | 内容 |
| 内容 | 内容 | 内容 |
```

| 表头 | 表头 | 表头 |
| :---- | ----: | :----: |
| 内容 | 内容 | 内容 |
| 内容 | 内容 | 内容 |
| 内容 | 内容 | 内容 |