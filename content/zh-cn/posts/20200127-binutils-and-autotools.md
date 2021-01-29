+++
title = "上游优先，迈出第一步"
linktitle = "上游优先，迈出第一步"
description = "LoongArch生态建设起步"
date = 2021-01-27T20:35:23+08:00
draft = false
comment = true
toc = false
reward = false
categories = [
  ""
]
tags = [
  "新闻"
]
+++

随着龙芯 3A5000 CPU 的研制成功，带来了新的 LoongArch 指令集，虽然这个全新的指令集自主化程度很高，
但同时也意味着没有任何的社区支持，没有任何软件可以直接支持，想要建设生态，一切需要从头开始，
这是一项艰巨、繁重而且需要长期坚持和投入的任务。

<!--more-->

所幸，龙芯已经充分认识到了这个问题，从 LoongArch 开始，将坚持 **上游优先(upstream first)** 策略，
以更加开放的心态，积极参与社区项目，完善软件生态。

从社区的一些迹象来看，龙芯已经开始向上游合并补丁了，算是上游优先策略迈出了第一步。

## Binutils

2020年8月17日，Xu Chenghua 发出了第一封关于LoongArch的[邮件](https://sourceware.org/pipermail/binutils/2020-August/112855.html)，要求为龙芯保留 253~256 Machine numbers，
经过几轮沟通，最终上游将 258 分配给了 LoongArch 架构，并于 2020年12月13日正式合并到主分支。

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4cf2ad720078a9f490dd5b5bc8893a926479196e

## GNU Autotools

GNU Autotools 是POSIX系统中重要的软件构建套件，它支持将自由软件构建和安装到正在运行的系统中。

相信玩过 Linux 的人，都知道经典的Linux软件编译三步曲：

```
./configure
make
make install
```

在 `./configure` 阶段，Autotools 会扫描宿主机系统（即当前正在运行的计算机）以进行各种测试并完成默认设置。

在测试过程中，有一项是系统架构测试，当在陌生的新架构中运行时，`./configure` 将报错并退出，导致无法完成软件编译。

其中最关键的2个架构相关文件为：`config.guess` 和 `config.sub`。

### config.git

GNU Autotools 套件中 `config.guess` 和`config.sub`，被独立维护在为 [config.git](https://git.savannah.gnu.org/gitweb/?p=config.git;a=summary) 仓库。

其他软件如gnulib、automake将不定期从这里获取，并合入自己的代码树中，最终上游开发者通过GNU Autotools打包后，这2个文件将进入tarballs中被发布。

Wu Xiaotian 提交了与LA架构相关的补丁，并于2020年12月22日被合并到 **config.git** 主分支。

https://git.savannah.gnu.org/gitweb/?p=config.git;a=commitdiff;h=c8ddc8472f8efcadafc1ef53ca1d863415fddd5f

### gnulib

gnulib 代码被大多数软件直接集成，如 coreutils、grub 等等，目前也已经从 config.git 拉取了相关补丁。

https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=6f600ec73085df142211bf8505083dcdd59859bb

https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=4c30b1b0d2ee72d89069b09f4257c30372c5b5a2

### automake

automake 更新较慢，相信下次拉取 config.git 代码后，也会进入主分支，预计1.18版本将会直接支持LoongArch架构。

automake 的历史版本，社区已经做了架构支持，并维护在以下分支，有需要的话可通过这里获取：

1.16: https://github.com/loongarch64/automake/tree/la64/1.16

1.16.1: https://github.com/loongarch64/automake/tree/la64/1.16.1

1.16.2: https://github.com/loongarch64/automake/tree/la64/1.16.2

1.16.3: https://github.com/loongarch64/automake/tree/la64/1.16.3


虽然目前龙芯对于一些重量级的软件，如kernel、gcc、binutils、glibc、qemu等代码，还没有向上游发起合并，
但相信随着时间的推移，这些软件在准备就绪之后，也会很快合并到上游。

要完善LoongArch生态，一个公司的人手和精力显然有限，希望感兴趣的社区爱好者可以参与，共同来建设LoongArch生态。
