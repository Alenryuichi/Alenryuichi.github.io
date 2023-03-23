---
title: 不同平台部署及继续发布hexo博客
toc: true
date: 2023-03-22 03:35:00
updated:
sticky:
tags:
  - Hexo
categories:
  - 博客技术
keywords:
description: 介绍了hexo的使用方法及markdown部分语法
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
# 不同平台部署及继续发布hexo博客
> **先决条件**：
> - 已在github中部署hexo博客
> - github中包含master分支与hexo分支
>   - master分支用于发布博客静态文件
>   - hexo文件用于同步博客项目文件
## windows平台/Linux平台

### 1. nodejs
下载[nodejs](http://nodejs.cn/)并安装。

安装流程参考：[NodeJS入门](https://blog.csdn.net/muzidigbig/article/details/80493880)
### 2. 克隆项目
```bash
git clone git@xxxxx.git
```
### 3. 更新node
> 用npm下载node时，需要加--save，其作用：指示NPM自动将软件包添加进package.json的dependencies部分中，从而为您节省了额外的步骤。
```bash
#安装package.json中的依赖
npm install
```
### 4. hexo博客测试与部署
```bash
# 清除部署缓存
hexo clean
# 生成静态文件  
hexo g
# 在localhost部署      
hexo s      
# 将生成的静态文件部署到github的master分支上
hexo d
```

进入hexo博客预览静态页面效果。

### 5. 如何将博客分发到不同平台
- [利用GitHook实现博客园文章的备份和自动发布](https://blog.csdn.net/weixin_30876945/article/details/97546788)



有问题可以在评论区提出。