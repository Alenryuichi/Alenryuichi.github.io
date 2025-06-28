#!/bin/bash

# Boulder专区工作空间管理脚本
# 用于管理Boulder专区的开发和部署

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 项目信息
PROJECT_NAME="Boulder专区"
REPO_URL="git@github.com:Alenryuichi/Alenryuichi.github.io.git"
BRANCH="hexo"

# 函数：打印带颜色的消息
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}[$(date '+%Y-%m-%d %H:%M:%S')] ${message}${NC}"
}

# 函数：检查命令是否成功执行
check_command() {
    if [ $? -eq 0 ]; then
        print_message $GREEN "✅ $1 成功"
    else
        print_message $RED "❌ $1 失败"
        exit 1
    fi
}

# 函数：显示菜单
show_menu() {
    echo ""
    print_message $BLUE "🧗‍♂️ Boulder专区工作空间管理"
    echo "=================================="
    echo "1. 检查项目状态"
    echo "2. 生成静态文件"
    echo "3. 本地预览"
    echo "4. 提交更改"
    echo "5. 推送到远程仓库"
    echo "6. 完整部署流程"
    echo "7. 清理缓存"
    echo "8. 查看git日志"
    echo "9. 退出"
    echo "=================================="
    echo -n "请选择操作 (1-9): "
}

# 函数：检查项目状态
check_status() {
    print_message $YELLOW "📊 检查项目状态..."
    
    echo ""
    print_message $BLUE "Git状态:"
    git status --short
    
    echo ""
    print_message $BLUE "当前分支:"
    git branch --show-current
    
    echo ""
    print_message $BLUE "最近提交:"
    git log --oneline -5
    
    echo ""
    print_message $BLUE "Boulder专区文件:"
    if [ -f "source/boulder/index.md" ]; then
        print_message $GREEN "✅ Boulder专区主页存在"
    else
        print_message $RED "❌ Boulder专区主页不存在"
    fi
    
    if [ -f "themes/butterfly/layout/includes/page/boulder.pug" ]; then
        print_message $GREEN "✅ Boulder布局文件存在"
    else
        print_message $RED "❌ Boulder布局文件不存在"
    fi
    
    # 检查Boulder相关文章
    boulder_posts=$(find source/_posts -name "*Boulder*" -o -name "*攀岩*" | wc -l)
    print_message $BLUE "Boulder相关文章数量: $boulder_posts"
}

# 函数：生成静态文件
generate_site() {
    print_message $YELLOW "🔨 生成静态文件..."
    
    # 清理旧文件
    hexo clean
    check_command "清理旧文件"
    
    # 生成新文件
    hexo generate
    check_command "生成静态文件"
    
    print_message $GREEN "✅ 静态文件生成完成"
}

# 函数：本地预览
local_preview() {
    print_message $YELLOW "🌐 启动本地预览服务器..."
    print_message $BLUE "预览地址: http://localhost:4000"
    print_message $BLUE "Boulder专区: http://localhost:4000/boulder/"
    print_message $YELLOW "按 Ctrl+C 停止服务器"
    
    hexo server
}

# 函数：提交更改
commit_changes() {
    print_message $YELLOW "📝 提交更改..."
    
    # 显示当前状态
    echo ""
    print_message $BLUE "当前更改:"
    git status --short
    
    # 添加所有更改
    git add .
    check_command "添加文件到暂存区"
    
    # 获取提交信息
    echo ""
    echo -n "请输入提交信息 (默认: 更新Boulder专区内容): "
    read commit_message
    
    if [ -z "$commit_message" ]; then
        commit_message="更新Boulder专区内容 - $(date '+%Y-%m-%d %H:%M:%S')"
    fi
    
    # 提交更改
    git commit -m "$commit_message"
    check_command "提交更改"
    
    print_message $GREEN "✅ 更改已提交: $commit_message"
}

# 函数：推送到远程仓库
push_to_remote() {
    print_message $YELLOW "🚀 推送到远程仓库..."
    
    # 检查当前分支
    current_branch=$(git branch --show-current)
    print_message $BLUE "当前分支: $current_branch"
    
    # 推送到远程
    git push origin $current_branch
    check_command "推送到远程仓库"
    
    print_message $GREEN "✅ 已推送到远程仓库"
}

# 函数：完整部署流程
full_deploy() {
    print_message $YELLOW "🚀 开始完整部署流程..."
    
    # 1. 检查状态
    check_status
    
    echo ""
    echo -n "是否继续部署? (y/N): "
    read confirm
    
    if [[ $confirm =~ ^[Yy]$ ]]; then
        # 2. 生成静态文件
        generate_site
        
        # 3. 提交更改
        commit_changes
        
        # 4. 推送到远程
        push_to_remote
        
        # 5. 部署到GitHub Pages
        print_message $YELLOW "📦 部署到GitHub Pages..."
        hexo deploy
        check_command "部署到GitHub Pages"
        
        print_message $GREEN "🎉 完整部署流程完成!"
        print_message $BLUE "网站地址: https://alenryuichi.github.io"
        print_message $BLUE "Boulder专区: https://alenryuichi.github.io/boulder/"
    else
        print_message $YELLOW "部署已取消"
    fi
}

# 函数：清理缓存
clean_cache() {
    print_message $YELLOW "🧹 清理缓存..."
    
    # 清理Hexo缓存
    hexo clean
    check_command "清理Hexo缓存"
    
    # 清理npm缓存
    npm cache clean --force
    check_command "清理npm缓存"
    
    # 清理node_modules (可选)
    echo ""
    echo -n "是否重新安装依赖? (y/N): "
    read reinstall
    
    if [[ $reinstall =~ ^[Yy]$ ]]; then
        rm -rf node_modules
        npm install
        check_command "重新安装依赖"
    fi
    
    print_message $GREEN "✅ 缓存清理完成"
}

# 函数：查看git日志
view_git_log() {
    print_message $YELLOW "📜 查看Git日志..."
    
    echo ""
    print_message $BLUE "最近10次提交:"
    git log --oneline --graph --decorate -10
    
    echo ""
    print_message $BLUE "Boulder相关提交:"
    git log --oneline --grep="Boulder" --grep="攀岩" --grep="boulder" -i
}

# 函数：初始化检查
init_check() {
    print_message $BLUE "🔍 初始化检查..."
    
    # 检查是否在正确的目录
    if [ ! -f "_config.yml" ]; then
        print_message $RED "❌ 未找到_config.yml文件，请确保在正确的项目目录中运行此脚本"
        exit 1
    fi
    
    # 检查是否安装了hexo
    if ! command -v hexo &> /dev/null; then
        print_message $RED "❌ 未找到hexo命令，请先安装hexo-cli"
        print_message $BLUE "安装命令: npm install -g hexo-cli"
        exit 1
    fi
    
    # 检查是否安装了依赖
    if [ ! -d "node_modules" ]; then
        print_message $YELLOW "⚠️  未找到node_modules，正在安装依赖..."
        npm install
        check_command "安装依赖"
    fi
    
    print_message $GREEN "✅ 初始化检查完成"
}

# 主程序
main() {
    # 初始化检查
    init_check
    
    # 主循环
    while true; do
        show_menu
        read choice
        
        case $choice in
            1)
                check_status
                ;;
            2)
                generate_site
                ;;
            3)
                local_preview
                ;;
            4)
                commit_changes
                ;;
            5)
                push_to_remote
                ;;
            6)
                full_deploy
                ;;
            7)
                clean_cache
                ;;
            8)
                view_git_log
                ;;
            9)
                print_message $GREEN "👋 再见!"
                exit 0
                ;;
            *)
                print_message $RED "❌ 无效选择，请输入1-9"
                ;;
        esac
        
        echo ""
        echo -n "按回车键继续..."
        read
    done
}

# 运行主程序
main
