+++
title = "2021年二季度社区动态"
description = "2021年二季度社区动态"
date = 2021-08-01T14:35:00+08:00
draft = false
comment = true
toc = true
reward = false
categories = [
  ""
]
tags = [
  "新闻"
]
+++

2021年二季度，LoongArch 平台的基础软件、开发语言及系统软件正逐步开放并积极向上游提交中...

<!--more-->

## 基础软件

### 内核

内核经过代码移植和重新整理，目前最新开发版本 5.14 分别维护在以下地址:

Github 仓库: https://github.com/loongson/linux/tree/loongarch-next

kernel.org 仓库: https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next

为了让内核早日进入主线，Huacai Chen 从 2021 年 7 月 6 日开始，与上游社区进行了多轮沟通，并积极按社区要求对补丁进行修订，期待上游能早日合并。

感兴趣可阅读这里: https://lore.kernel.org/linux-arch/20210706041820.1536502-1-chenhuacai@loongson.cn/

### 工具链

LoongArch 工具链经过紧张的移植、测试，目前已经升级到最新开发版本:

gcc: https://github.com/loongson/gcc

binutils: https://github.com/loongson/binutils-gdb

glibc: https://github.com/loongson/glibc

工具链期待更多的测试和反馈，也欢迎各位社区爱好者能参与完善。

预编译好的交叉编译工具链及 rootfs 环境，请参见这里: https://github.com/loongson/build-tools

### qemu

https://github.com/loongson/qemu/pull/1

qemu 的 user-mode 的代码正在开放 review 中。

同学们即便暂时没有 3A5000 机器，LoongArch 汇编也可以学起来了。

## 开发语言

### Go

https://go-review.googlesource.com/c/go/+/333909

WANG Xuerui 提交了预留 [GOARCH=loong64](https://github.com/golang/go/pull/47129) 架构的补丁，上游已经审核通过，预计于 go-1.17 版本中发布。

龙芯已将先前移植的 go-1.15.6 源码放出，代码仓库: https://github.com/loongson/go

### Java

Ao Qi 为 OpenJDK 提交了最基础的 LoongArch 架构支持，代码已被合并。

https://github.com/openjdk/jdk/commit/e92e2fd4e0bc805d8f7d70f632cce0282eb1809b

## 系统软件

**bdwgc**

Zhang Na 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 14 日被合并到主分支。

https://github.com/ivmai/bdwgc/commit/c86b7fc0750e518d6f85d4f4e95a87bbc309572b

**botan**

Zhang Na 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 12 日被合并到主分支。

https://github.com/randombit/botan/commit/6eb5a8a8c883025cb204c91fd2c1ccafca357364

**double-conversion**

houfangdong 提交了与 LoongArch 架构相关的补丁，并于 2021 年 5 月 19 日被合并到主分支。

https://github.com/google/double-conversion/commit/32bc443c60c860eb6b4843533a614766d611172e

**file**

Wu Xiaotian 提交了与 LoongArch 架构相关的补丁，并于 2021 年 5 月 25 日被合并到主分支。

https://github.com/file/file/commit/0d47491f8f7134940bbd33b98a77a36dff4879b3

**gsl**

Zhang Na 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 9 日被合并到主分支。

https://github.com/zeromq/gsl/commit/780e07ad647dd4ee55444ba83be71af84c8b9ca7

**hwinfo**

jinqingchen 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 2 日被合并到主分支。

https://github.com/openSUSE/hwinfo/pull/100

**libaio**

yehui ren 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 20 日被合并到主分支。

https://pagure.io/libaio/c/48f4fb7d688e26b05c76e3d0fabdefc6c5f66241?branch=master

https://pagure.io/libaio/c/97076c8a55064e6f34483d41f6bffff3838f5b61?branch=master

https://pagure.io/libaio/c/de492eef5edf3b6f61d069f1a723d011228ee567?branch=master

https://pagure.io/libaio/c/d892696468cb99d7d98b23b78bde942df0992d5a?branch=master

**libmowgli-2**

zhangjialing 提交了与 LoongArch 架构相关的补丁，并于 2021 年 6 月 4 日被合并到主分支。

https://github.com/atheme/libmowgli-2/commit/bd45f33c87e1dd4744300a70bbc91c0d04f87c49

https://github.com/atheme/libmowgli-2/commit/669ec93899b35e464aed1fb503319377a0961cba

**linux-rdma**

wangguofeng 提交了与 LoongArch 架构相关的补丁，并于 2021 年 8 月 2 日被合并到主分支。

https://github.com/linux-rdma/rdma-core/commit/071c10a24b11b7c54d80917a8d1c146f956f9848

**matio**

zhangjialing 提交了与 LoongArch 架构相关的补丁，并于 2021 年 6 月 3 日被合并到主分支。

https://github.com/tbeu/matio/commit/f93a57597c9df27bbce98b6a9a4e24ebd205eca1

**systemd**

WANG Xuerui 提交了与 LoongArch 架构相关的补丁，并于 2021 年 7 月 14 日被合并到主分支。

https://github.com/systemd/systemd/commit/3cfd5ddd59aa4a7c365bd86fa7755610e8ad7296

**util-linux**

WANG Xuerui 提交了与 LoongArch 架构相关的补丁，并于 2021 年 8 月 2 日被合并到主分支。

https://github.com/karelzak/util-linux/commit/2d29fccaad267d1b003dc0ed2bb9634ff76f3e49


目前还有一些系统软件正在 review 中，详情见 https://github.com/loongarch64 组织。

注: 本网站为完全开放社区，欢迎广大爱好者通过给 [website](https://github.com/loongarch64/website) 发起 PR 进行投稿！
