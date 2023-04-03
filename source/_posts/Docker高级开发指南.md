---
title: Docker开发指南
toc: true
date: 2023-03-25 22:45:21
updated:
sticky:
tags:
  - Docker
categories:
  - 后台开发
    - 初级指南
keywords:
description:
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

# Docker使用指南
本指南旨在帮助中高级开发者使用Docker来进行应用程序的开发、测试、部署和上线。

## Docker简介
Docker是一个容器化平台，可以将应用程序和它们的依赖打包在一个容器中，并提供了一种轻量级的虚拟化技术，使得应用程序可以在任何地方以相同的方式运行。Docker的核心概念包括Docker镜像、Docker容器和Docker仓库。

- Docker镜像：一个Docker镜像是一个只读的模板，其中包含了一个完整的文件系统和运行该文件系统的配置信息。镜像是用于创建Docker容器的基础。
- Docker容器：Docker容器是从Docker镜像中创建的一个运行实例。容器可以被启动、停止、重启、删除等操作，并且每个容器都是独立的运行环境。
- Docker仓库：Docker仓库是用来存储Docker镜像的地方。Docker Hub是一个公共的Docker仓库，而私有仓库可以通过Docker Registry来搭建。

## 安装Docker
在开始使用Docker之前，需要先安装Docker。Docker的安装可以参考官方文档：https://docs.docker.com/engine/install/。

安装完成后，可以通过运行以下命令来验证Docker是否安装成功：
```bash
docker version
```
## 创建Docker镜像
创建Docker镜像的方式有多种，下面介绍其中的两种。

### 基于Dockerfile创建镜像
Dockerfile是一个包含了构建Docker镜像所需的指令的文本文件。通过Dockerfile，可以定义容器的基础镜像、安装软件、配置环境变量等等。

下面是一个简单的Dockerfile示例：

```bash
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y nginx

CMD ["nginx", "-g", "daemon off;"]
```
这个Dockerfile定义了一个基于Ubuntu 20.04的镜像，安装了Nginx，并设置Nginx以非守护进程方式运行。

使用Dockerfile创建镜像的命令为：
```bash
docker build -t my-nginx-image .
```
其中，-t参数用来指定镜像的名称，.表示使用当前目录下的Dockerfile文件。

### 基于容器创建镜像
在容器中安装软件并对容器进行配置，然后将该容器保存为镜像，这种方式也可以创建Docker镜像。

首先，需要创建一个容器，并进入该容器的shell环境：

```bash
docker run -it --name my-nginx-container nginx /bin/bash
```
其中，-it参数表示以交互式方式运行容器，并进入容器的shell环境。

件并进行配置，比如安装软件包、修改配置文件等等，然后使用以下命令将该容器保存为镜像：

```bash
docker commit my-nginx-container my-nginx-image
```
其中，my-nginx-container是容器的名称，my-nginx-image是镜像的名称。

## 运行Docker容器
创建Docker容器后，可以使用以下命令来启动容器：

```bash
docker run -d --name my-nginx-container -p 80:80 my-nginx-image
```
其中，-d参数表示以后台方式运行容器，--name参数指定容器的名称，-p参数指定端口映射，my-nginx-image是要运行的镜像名称。

如果需要进入正在运行的容器的shell环境，可以使用以下命令：

```bash
docker exec -it my-nginx-container /bin/bash
```
其中，-it参数表示以交互式方式进入容器的shell环境。

## Docker网络
Docker支持多种网络模式，包括桥接模式、主机模式、容器模式和覆盖网络模式等。

### 桥接模式
桥接模式是Docker默认的网络模式，通过桥接方式将容器连接到宿主机的网络中。在桥接模式下，Docker会为每个容器分配一个IP地址。

以下是在桥接模式下启动容器的示例命令：

```bash
docker run -d --name my-nginx-container -p 80:80 my-nginx-image
```
其中，-p参数指定端口映射，将宿主机的80端口映射到容器的80端口。

### 主机模式
主机模式下，容器和宿主机共享同一个网络命名空间，容器的网络直接映射到宿主机上。在主机模式下，不需要进行端口映射，容器中的应用程序可以直接使用宿主机的网络接口。

以下是在主机模式下启动容器的示例命令：

```bash
docker run -d --name my-nginx-container --network host my-nginx-image
```
其中，--network参数指定网络模式为主机模式。

### 容器模式
容器模式下，多个容器共享同一个网络命名空间，可以直接使用容器之间的IP地址进行通信。

以下是在容器模式下启动容器的示例命令：

```bash
docker run -d --name my-nginx-container --net container:my-mysql-container my-nginx-image
```
其中，--net参数指定网络模式为容器模式，并指定了容器my-mysql-container作为网络命名空间。

### 覆盖网络模式
覆盖网络模式允许在Docker集群中创建独立的网络命名空间，容器可以连接到这些网络中，实现多个容器之间的通信。

以下是在覆盖网络模式下启动容器的示例命令

```bash
docker network create my-network

docker run -d --name my-nginx-container --network my-network my-nginx-image
```
其中，第一行命令创建一个名为my-network的网络，第二行命令启动一个容器，并将其连接到my-network网络中。

## Docker存储
Docker支持多种存储方式，包括本地存储、共享存储和云存储等。

### 本地存储
本地存储是指将数据存储在宿主机上，容器可以直接访问宿主机上的文件系统。

以下是在本地存储中创建一个数据卷的示例命令：

```bash
docker volume create my-data-volume
```
创建数据卷后，可以在启动容器时将其挂载到容器中：

```bash
docker run -d --name my-nginx-container -v my-data-volume:/data my-nginx-image
```
其中，-v参数指定挂载数据卷，将my-data-volume数据卷挂载到容器的/data目录下。

### 共享存储
共享存储是指将数据存储在网络存储设备上，多个容器可以共享同一个存储卷。

以下是在共享存储中创建一个数据卷的示例命令：

```bash
docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.0.1,rw \
    --opt device=:/path/to/nfs/share my-nfs-volume
```
创建NFS存储卷后，可以在启动容器时将其挂载到容器中：

```bash

docker run -d --name my-nginx-container -v my-nfs-volume:/data my-nginx-image
```
其中，-v参数指定挂载数据卷，将my-nfs-volume数据卷挂载到容器的/data目录下。

### 云存储
云存储是指将数据存储在云端存储服务上，如Amazon S3、Microsoft Azure Blob Storage等。

以下是在Amazon S3中创建一个存储桶的示例命令：

```bash

docker run -e AWS_ACCESS_KEY_ID=<aws-access-key-id> \
    -e AWS_SECRET_ACCESS_KEY=<aws-secret-access-key> \
    -e AWS_REGION=<aws-region> \
    amazon/aws-cli s3 mb s3://my-s3-bucket
```
创建S3存储桶后，可以在启动容器时将其挂载到容器中：

```bash

docker run -d --name my-nginx-container \
    -e AWS_ACCESS_KEY_ID=<aws-access-key-id> \
    -e AWS_SECRET_ACCESS_KEY=<aws-secret-access-key> \
    -e AWS_REGION=<aws-region> \
    -v my-s3-bucket:/data \
    my-nginx-image
```
其中，-v参数指定挂载存储桶，将my-s3-bucket存储桶挂载到容器的/data目录下。

### Docker数据卷
Docker数据卷是将宿主机的目录或文件夹与容器中的目录或文件夹进行映射，实现数据的持久化和共享。

#### 创建数据卷
以下是创建数据卷的示例命令：

```bash
docker volume create my-data-volume
```
其中，my-data-volume是数据卷的名称。

#### 挂载数据卷
以下是将数据卷挂载到容器中的示例命令：

```bash
docker run -d --name my-nginx-container -p 80:80 -v my-data-volume:/data my-nginx-image
```
其中，-v参数指定数据卷的挂载方式，将my-data-volume数据卷挂载到容器中的/data目录中。

##　Docker Compose
Docker Compose是一个用于定义和运行多个Docker容器的工具，使用YAML文件定义各个容器的服务、网络、卷等配置信息，可以快速地启动、停止和重启多个容器。

以下是一个使用Docker Compose定义的Nginx和MySQL容器示例：

```yaml
version: '3'

services:
  nginx:
    image: nginx
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
  mysql:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: example

```
以上示例定义了两个服务：nginx和mysql，分别使用nginx和mysql镜像创建容器，配置了端口映射和数据卷挂载，同时mysql容器还指定了环境变量。

可以使用以下命令启动和停止Docker Compose定义的容器：
```bash
docker-compose up -d
docker-compose down
```

其中，up命令用于启动容器，down命令用于停止容器。

总结
本文介绍了Docker的基本概念和使用方法，包括Docker镜像、容器、网络和数据卷等内容，同时介绍了使用Docker Compose定义和运行多个容器的方法。希望可以帮助开发者更好地使用Docker进行应用开发、测试、部署和上线。
