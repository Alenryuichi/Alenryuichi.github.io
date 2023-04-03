# Hexo 博客维护指南

本文档旨在规范 Hexo 博客的 Git 操作，并提供 Hexo 的使用方法。

## Git 操作规范

### Git 分支规范

- `hexo`：主分支，用于发布稳定版本，不可直接修改。
- `develop`：开发分支，用于开发新功能、修复 bug，不可直接修改。
- `feature-*`：功能分支，用于新功能的开发，从 `develop` 分支分出，完成后合并回 `develop` 分支。
- `bugfix-*`：修复分支，用于修复 bug，从 `develop` 分支分出，完成后合并回 `develop` 分支。

### Git 提交规范

为了方便代码维护和版本控制，我们需要对 Git 提交信息进行规范化。推荐使用如下格式：

```
<type>(<scope>): <subject>

<body>

<footer>
```

- `<type>`：提交类型，建议使用以下几种类型：
  - `feat`：新功能
  - `fix`：修复 bug
  - `docs`：文档更新
  - `style`：代码格式化、样式调整等不涉及功能修改的改动
  - `refactor`：代码重构
  - `test`：测试用例
  - `chore`：构建、打包等杂项操作
- `<scope>`：修改范围，建议使用以下几种范围：
  - `config`：配置文件
  - `theme`：主题相关
  - `post`：文章相关
  - `page`：页面相关
  - `plugin`：插件相关
- `<subject>`：简要说明修改内容
- `<body>`：详细说明修改内容
- `<footer>`：可选，用于关闭 issue、添加链接等

例如：

```
feat(config): 添加网站统计代码

为了方便网站访问统计，添加了百度统计代码。

closes #123
```

### Git 操作流程

1. 检出 `develop` 分支：`git checkout develop`
2. 从 `develop` 分支创建新的功能分支：`git checkout -b feature-new-function`
3. 在新的功能分支上进行开发
4. 开发完成后，合并回 `develop` 分支：
   1. 切换回 `develop` 分支：`git checkout develop`
   2. 合并分支：`git merge --no-ff feature-new-function`
   3. 删除分支：`git branch -d feature-new-function`
   4. 推送到远程仓库：`git push origin develop`
5. 发布新版本时，从 `develop` 分支创建新的发布分支：`git checkout -b release-0.1.0`
6. 在发布分支上进行测试，修复 bug
7. 发布正式版本：
   1. 合并回 `master` 分支：`git checkout master`，`git merge --no-ff release-0.1.0`
   2. 打上标签：`git tag v0.1.0`
   3. 推送到远程仓库：`git push origin master --tags`
8. 合并回 `develop` 分支：`git checkout develop`，`git merge --no-ff release-0.1.0`
9. 删除发布分支：`git branch -d release-0.1.0`

## Hexo 使用方法

### 安装 Hexo

1. 安装 Node.js 和 Git。
2. 安装 Hexo：`npm install -g hexo-cli`
3. 初始化博客：`hexo init my-blog`
4. 进入博客目录：`cd my-blog`
5. 安装依赖：`npm install`

### 配置 Hexo

1. 打开 `_config.yml` 文件进行配置，例如：

   ```
   title: My Blog
   subtitle: Enjoy writing
   description: This is my blog powered by Hexo.
   author: John Doe
   language: en
   timezone: Asia/Shanghai
   
   # Deployment
   ## Docs: https://hexo.io/docs/deployment.html
   deploy:
     type: git
     repo: git@github.com:username/my-blog.git
     branch: master
   ```

2. 打开 `themes` 目录，选择并配置主题。

### 编写文章

1. 创建文章：`hexo new "My First Post"`, 会在`source/_posts`创建一个md文件
2. 在 `source/_posts` 目录下编辑文章，使用 Markdown 语法。
3. 清除静态文件: `hexo c`
4. 生成静态文件: `hexo g`
5. localhost预览文章：`hexo s`
6. 发布文章：`hexo deploy`

### 文章技巧

1. 图片
使用以下代码来添加图片：

```
<img src="图片链接" alt="图片描述">
```

其中，`src` 表示图片的链接，`alt` 表示图片的描述或替换文本（如果图片无法显示）。

举个例子：

```
<div style="width: 50%;"> 
  <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg" alt="一棵树">
</div>
```

这将在你的网页上插入一张来自 Pixabay 的树的图片。

2. 视频

使用以下代码来添加视频：

```html
<video controls> 
  <source src="视频链接" type="视频类型">
</video>
```

其中，`src` 表示视频的链接，`type` 表示视频的类型。`controls` 属性会在视频下方添加控制条。

举个例子(视频自适应网页大小)：

```html
<video controls width="100%" height="auto">
  <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
</video>
```

### 其他命令

- 生成静态文件：`hexo generate` 或 `hexo g`
- 清理缓存：`hexo clean`
- 帮助文档：`hexo --help` 或 `hexo -h`

## 结语

本文档仅提供一种 Git 操作规范和 Hexo 使用方法，可根据具体情况进行调整。希望能为 Hexo 博客的维护提供帮助。


## 联系作者

邮箱：miaojs@outlook.com

微信：xxxxxx

博客地址：xxxxxx