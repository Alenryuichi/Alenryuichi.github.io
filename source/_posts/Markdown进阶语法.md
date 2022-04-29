---
title: Markdown进阶语法（hexo部分不支持）
toc: true
date: 2022-04-28 22:50:36
updated:
sticky:
tags:
  - Markdown
categories:
  - 博客技术
keywords:
description: 进阶语法：换行、缩进、特殊符号、字体特效、注脚、背景色与emoji颜色等
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
# 1. 进阶语法
## 1.1. 换行
连续两个以上空格+回车
## 1.2. 缩进字符
```markdown
&#160;1/4个中文缩进
&#8194;半个中文缩进，1字符
&#8195;1个中文缩进，2字符
```
未缩进  
&#160;1/4个中文缩进  
&#8194;半个中文缩进，1字符  
&#8195;1个中文缩进，2字符
## 1.3. 特殊符号
### 1.3.1. \
显示字符本身
### 1.3.2. 其他符号

具体可参考[markdown特殊符号](https://www.axihe.com/tools/markdown/with-html/special-symbol.html)
与[Unicode字符码查询](https://unicode-table.com/cn/)
|命令|效果|  
|---|---|
|`&#10084;`|&#10084;|
|`&#10003;`|&#10003;|
|`&#10004;`|&#10004;|
|`&#10005;`|&#10005;|
|`&#1;`|&#1;|
|`&#9742;`|&#9742;|
|`&#5748;`|&#5748;|
|`&#5223;`|&#5223;|
|`&#8734;`|&#8734;|
|`&#10008;`|&#10008;|
## 1.4. 字体、字号与颜色
通过内嵌HTML代码实现字体特效,字体大小(size)范围<font color=#0099ff face="黑体" size=5>[1,7]</font>    
对字体颜色的修改可查询[HTML颜色代码表](http://xh.5156edu.com/page/z1015m9220j18754.html)
```markdown
<font color=#0099ff face="黑体">color=#0099ff 黑体字体</font>  
<font face="微软雅黑">微软雅黑字体</font>  
<font face="STCAIYUN">华为彩云</font>  
<font color=#0099ff size=1 face="黑体">size=1</font>  
<font color=#0099ff size=2 face="黑体">size=2</font>  
<font color=#0099ff size=3 face="黑体">size=3</font>  
<font color=#0099ff size=4 face="黑体">size=4</font>  
<font color=#0099ff size=5 face="黑体">size=5</font>  
<font color=#0099ff size=6 face="黑体">size=6</font>  
<font color=#0099ff size=7 face="黑体">size=7</font>  
```
<font color=#0099ff face="黑体">color=#0099ff 黑体字体</font>  
<font face="微软雅黑">微软雅黑字体</font>  
<font face="STCAIYUN">华为彩云</font>  
<font color=#0099ff size=1 face="黑体">size=1</font>  
<font color=#0099ff size=2 face="黑体">size=2</font>  
<font color=#0099ff size=3 face="黑体">size=3</font>  
<font color=#0099ff size=4 face="黑体">size=4</font>  
<font color=#0099ff size=5 face="黑体">size=5</font>  
<font color=#0099ff size=6 face="黑体">size=6</font>  
<font color=#0099ff size=7 face="黑体">size=7</font>  
## 1.5. 注脚
在需要添加注脚的文字后加上脚注名字[^注脚名字],称为加注。 然后在文本的任意位置(一般在最后)添加脚注，脚注前必须有对应的脚注名字。  
示范如下：
> 注意需要添加空格！
```markdown
脚注演示段落[^1]，需要演示一下脚注的使用方法[^2]  
  
[^1]: 脚注1  
[^2]: 脚注2
```

脚注演示段落[^1]，需要演示一下脚注的使用方法[^2]  
  
[^1]: 脚注1  
[^2]: 脚注2
## 1.6. 背景色
```markdown
<table><tr><td bgcolor=orange>背景色是：orange</td></tr></table>
```

<table><tr><td bgcolor=orange>背景色是：orange</td></tr></table>

## 1.7. emoji表情
emoji表情使用:EMOJICODE:的格式，详细列表可见[Emoji cheat sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/)
```markdown
:smile:  
:blush:  
:heart_eyes:  
:flushed:  
:stuck_out_tongue_closed_eyes:
```
:smile:  
:blush:  
:heart_eyes:  
:flushed:  
:stuck_out_tongue_closed_eyes: