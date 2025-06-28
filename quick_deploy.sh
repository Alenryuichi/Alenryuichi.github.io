#!/bin/bash

# Boulder专区快速部署脚本
# 简化版本，用于快速提交和部署

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🧗‍♂️ Boulder专区快速部署${NC}"
echo "=================================="

# 1. 显示当前状态
echo -e "${YELLOW}📊 当前状态:${NC}"
git status --short

# 2. 添加所有更改
echo -e "${YELLOW}📝 添加更改...${NC}"
git add .

# 3. 获取提交信息
echo ""
echo -n "请输入提交信息 (回车使用默认信息): "
read commit_message

if [ -z "$commit_message" ]; then
    commit_message="更新Boulder专区 - $(date '+%Y-%m-%d %H:%M:%S')"
fi

# 4. 提交更改
echo -e "${YELLOW}💾 提交更改...${NC}"
git commit -m "$commit_message"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 提交成功${NC}"
else
    echo -e "${RED}❌ 提交失败${NC}"
    exit 1
fi

# 5. 推送到远程
echo -e "${YELLOW}🚀 推送到远程仓库...${NC}"
git push

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 推送成功${NC}"
else
    echo -e "${RED}❌ 推送失败${NC}"
    exit 1
fi

# 6. 询问是否生成和部署
echo ""
echo -n "是否生成静态文件并部署到GitHub Pages? (y/N): "
read deploy_confirm

if [[ $deploy_confirm =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}🔨 生成静态文件...${NC}"
    npx hexo clean && npx hexo generate

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ 生成成功${NC}"

        echo -e "${YELLOW}📦 部署到GitHub Pages...${NC}"
        npx hexo deploy
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}🎉 部署完成!${NC}"
            echo -e "${BLUE}网站地址: https://alenryuichi.github.io${NC}"
            echo -e "${BLUE}Boulder专区: https://alenryuichi.github.io/boulder/${NC}"
        else
            echo -e "${RED}❌ 部署失败${NC}"
        fi
    else
        echo -e "${RED}❌ 生成失败${NC}"
    fi
fi

echo ""
echo -e "${GREEN}✅ 操作完成!${NC}"
