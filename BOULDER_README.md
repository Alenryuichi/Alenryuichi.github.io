# 🧗‍♂️ Boulder专区使用指南

## 项目概述

Boulder专区是为攀岩爱好者创建的专门内容区域，包含攀岩技巧、训练方法、装备推荐等丰富内容。

## 文件结构

```
├── source/
│   ├── boulder/
│   │   └── index.md                    # Boulder专区主页
│   └── _posts/
│       ├── Boulder攀岩入门指南.md       # 入门指南文章
│       └── 攀岩力量训练完全指南.md      # 力量训练文章
├── themes/butterfly/layout/includes/page/
│   └── boulder.pug                     # Boulder专区自定义布局
├── _config.butterfly.yml               # 主题配置（已添加Boulder菜单）
├── boulder_workspace.sh                # 完整工作空间管理脚本
├── quick_deploy.sh                     # 快速部署脚本
└── BOULDER_README.md                   # 本说明文件
```

## 功能特性

### 1. 专区主页
- 📍 访问地址：`/boulder/`
- 🎨 自定义布局设计
- 📊 统计数据展示
- 🖼️ 图片画廊
- 🧭 快速导航菜单

### 2. 内容管理
- 📝 攀岩相关文章
- 🏷️ 专门的分类标签
- 🔍 内容搜索功能
- 📱 响应式设计

### 3. 工作空间管理
- 🛠️ 完整的开发工具链
- 🚀 一键部署功能
- 📊 项目状态监控
- 🧹 缓存清理工具

## 使用方法

### 快速开始

1. **查看当前状态**
   ```bash
   ./boulder_workspace.sh
   # 选择选项 1: 检查项目状态
   ```

2. **本地预览**
   ```bash
   ./boulder_workspace.sh
   # 选择选项 3: 本地预览
   # 访问 http://localhost:4000/boulder/
   ```

3. **快速部署**
   ```bash
   ./quick_deploy.sh
   ```

### 详细操作

#### 使用完整工作空间管理脚本

```bash
./boulder_workspace.sh
```

**菜单选项说明：**
- `1` - 检查项目状态：查看git状态、文件完整性
- `2` - 生成静态文件：清理并重新生成网站
- `3` - 本地预览：启动开发服务器
- `4` - 提交更改：添加并提交所有更改
- `5` - 推送到远程仓库：推送到GitHub
- `6` - 完整部署流程：一键完成所有部署步骤
- `7` - 清理缓存：清理各种缓存文件
- `8` - 查看git日志：查看提交历史
- `9` - 退出

#### 使用快速部署脚本

```bash
./quick_deploy.sh
```

这个脚本会：
1. 显示当前更改状态
2. 添加所有更改到git
3. 提交更改（可自定义提交信息）
4. 推送到远程仓库
5. 可选：生成静态文件并部署

## 内容管理

### 添加新的Boulder文章

1. **创建文章文件**
   ```bash
   hexo new post "文章标题"
   ```

2. **设置文章头部信息**
   ```yaml
   ---
   title: 文章标题
   date: 2025-06-28 12:00:00
   tags: [Boulder, 攀岩, 相关标签]
   categories: [Boulder专区]
   cover: /covers/图片文件名.jpg
   description: 文章简介
   ---
   ```

3. **编写文章内容**
   - 使用Markdown格式
   - 添加相关图片到 `source/covers/` 目录
   - 包含实用的攀岩知识和技巧

### 更新Boulder专区主页

编辑 `source/boulder/index.md` 文件：
- 更新内容信息
- 添加新的章节
- 修改统计数据

### 自定义页面样式

编辑 `themes/butterfly/layout/includes/page/boulder.pug` 文件：
- 修改页面布局
- 调整样式设计
- 添加新的功能模块

## 部署流程

### 开发环境部署

1. **安装依赖**
   ```bash
   npm install
   ```

2. **本地预览**
   ```bash
   hexo server
   ```

3. **访问地址**
   - 主站：http://localhost:4000
   - Boulder专区：http://localhost:4000/boulder/

### 生产环境部署

1. **生成静态文件**
   ```bash
   hexo clean
   hexo generate
   ```

2. **部署到GitHub Pages**
   ```bash
   hexo deploy
   ```

3. **访问线上地址**
   - 主站：https://alenryuichi.github.io
   - Boulder专区：https://alenryuichi.github.io/boulder/

## 故障排除

### 常见问题

1. **hexo命令未找到**
   ```bash
   npm install -g hexo-cli
   ```

2. **依赖安装失败**
   ```bash
   rm -rf node_modules
   npm cache clean --force
   npm install
   ```

3. **生成失败**
   ```bash
   hexo clean
   hexo generate --debug
   ```

4. **部署失败**
   - 检查git配置
   - 确认SSH密钥设置
   - 查看_config.yml中的deploy配置

### 日志查看

```bash
# 查看详细生成日志
hexo generate --debug

# 查看git状态
git status

# 查看最近提交
git log --oneline -5
```

## 维护建议

### 定期维护

1. **每周检查**
   - 运行 `./boulder_workspace.sh` 选项1检查状态
   - 更新内容和图片
   - 检查链接有效性

2. **每月维护**
   - 清理缓存：选项7
   - 更新依赖：`npm update`
   - 备份重要内容

### 内容更新

1. **保持内容新鲜**
   - 定期添加新的攀岩技巧
   - 更新训练方法
   - 分享最新的装备信息

2. **优化用户体验**
   - 检查页面加载速度
   - 优化图片大小
   - 改进导航结构

## 技术栈

- **静态网站生成器**: Hexo
- **主题**: Butterfly
- **模板引擎**: Pug
- **样式**: CSS3
- **部署**: GitHub Pages
- **版本控制**: Git

## 联系方式

如有问题或建议，请通过以下方式联系：
- GitHub Issues
- Email: alenryuichi@gmail.com

---

**祝您攀岩愉快！🧗‍♂️**
