+++
title = "2021年三季度社区动态"
linktitle = "2021年三季度社区动态"
description = "2021年三季度社区动态"
date = 2021-11-16T14:35:00+08:00
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

2021年三季度，LoongArch 平台开发者手册开放更新中；基础软件、开发语言、系统软件继续稳步推进；社区发行版数量有所增加。

## 开发者手册

[龙芯架构 ELF psABI](https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-CN.html)：该手册介绍了龙芯架构 ELF psABI。

[龙芯架构工具链约定](https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-CN.html)：该手册介绍了龙芯架构工具链的命令行界面和操作系统相关惯例。

以上手册作为开发者必备的参考资料，同时也是指导工具链实现的规范，目前在社区开放讨论并持续更新中， https://github.com/loongson/LoongArch-Documentation

## 基础软件

### EDK2

龙芯 UEFI 固件基于 edk2 开发，已经使用在 3A5000/3C5000L 等大量设备中，为了向上游推送代码，目前已经做了一些前期的准备工作。

1. DHCPv6 协议增加 LoongArch 架构支持

新增了 0x25、0x26、0x27、0x28 等 ID，这些 ID 在 PXE 网络启动时会用到。

```
0x00 0x25	LoongArch 32-bit UEFI
0x00 0x26	LoongArch 32-bit UEFI boot from http
0x00 0x27	LoongArch 64-bit UEFI
0x00 0x28	LoongArch 64-bit UEFI boot from http
```

文档地址： https://www.iana.org/assignments/dhcpv6-parameters/dhcpv6-parameters.xhtml#processor-architecture

2. PE 格式增加 LoongArch 架构支持

**Machine Types**

| Constant                                 | Value              | Description                             |
|------------------------------------------|--------------------|------------------------------------------
| IMAGE\_FILE\_MACHINE\_LOONGARCH32 <br/>  | 0x6232 <br/>       | LoongArch 32-bit processor family <br/> |
| IMAGE\_FILE\_MACHINE\_LOONGARCH64 <br/>  | 0x6264 <br/>       | LoongArch 64-bit processor family <br/> |

**Base Relocation Types**

| Constant                                       | Value   | Description                                                                                                        |
|------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------|
| IMAGE\_REL\_BASED\_LOONGARCH32\_MARK\_LA <br/> | 8 <br/> | This relocation is only meaningful when the machine type is LoongArch 32-bit. The base relocation applies to a 32-bit absolute address formed in two consecutive instructions. <br/> |
| IMAGE\_REL\_BASED\_LOONGARCH64\_MARK\_LA <br/> | 8 <br/> | This relocation is only meaningful when the machine type is LoongArch 64-bit. The base relocation applies to a 64-bit absolute address formed in four consecutive instructions. <br/> |

文档地址： https://docs.microsoft.com/en-us/windows/win32/debug/pe-format

提交记录： https://github.com/MicrosoftDocs/win32/commit/491fd3ebca91029bb05d5d1a932c92b7d01731af

### Linux

内核代码和上游经过多轮沟通，一直在持续完善中，目前开发版本已迁移到 5.16.0-rc1 版本，分别维护在以下地址:

Github 仓库： https://github.com/loongson/linux/tree/loongarch-next

kernel.org 仓库： https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next

### Binutils

Liu Zhensong 提交的 LoongArch 补丁已合并上游。

https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=01a8c731aacbdbed0eb5682d13cc074dc7e25fb3

https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=e214f8db56f65531b0a5ec296c42339dcaa5af31

https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=6cc76c40a99bd13d69a311cae5ec891bd1d1dbf2

https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=e9a0721f8274daeffaedbc3cabc12c52d43a38a7

https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=4462d7c440247bfcdc464412332bbec13b8aab12

### gcc

https://github.com/loongson/gcc

持续完善中

### glibc

https://github.com/loongson/glibc

持续完善中

### QEMU

LoongArch TCG host 移植已经全部完成，预计将在 QEMU 7.0 分支开放后合并（WANG Xuerui）：

https://patchew.org/QEMU/20211124183231.1503090-1-git@xen0n.name/

LoongArch linux-user 模拟正在 code review 流程中（Gao Song）：

https://patchew.org/QEMU/1637302410-24632-1-git-send-email-gaosong@loongson.cn/

LoongArch TCG Dev 初步的 LA 系统模拟支持，在开放 review 中（Yang Xiaojuan）：

https://github.com/loongson/qemu/pull/12

## 开发语言

### Javascript

Javascript V8 引擎已经合入 LoongArch 架构支持(loong64)。

https://chromium.googlesource.com/v8/v8.git [github 镜像](https://github.com/v8/v8)

## 系统软件

**box64**

Zhao Zhen 提交的 LoongArch 架构支持补丁上游已合并。

**hardinfo**

Liu Xiang 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/lpereira/hardinfo/commit/56e590d477a6422639235a6afe97f0c9637c459a

https://github.com/ptitSeb/box64/commit/d75116dab7ca889f21379697b91b942b59588ee1

**jemalloc**

Wang Jinlong 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/jemalloc/jemalloc/commit/2159615419a90b5473cfd9d3a4cb4700259d8c0b

**numactl**

Han Jianjun 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/numactl/numactl/commit/a5a429c6bd844308194a334c724e3a3e7f4a5806

**Numpy**

Zhang Na 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/numpy/numpy/commit/640d68ac8593be4006ea1e63f0354d7b07767541

https://github.com/numpy/numpy/commit/5f7f37ab49718e13038998673830411342e5ecdd

**patchelf**

Zhang Wenlong 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/NixOS/patchelf/commit/a174cf3006baf31e0e9eaa62bc9adead93af63f7

**pty**

Chen Guoqi 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/creack/pty/commit/b135084511330383e4d0adc4504cf407cab59bb0

**tbox**

Zhao Zhen 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/tboox/tbox/commit/7ca5145d40aa906fdc48b0b0e75e80412241be7e

**xrdp**

Liu Xiang 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/neutrinolabs/xrdp/commit/c36f92049deb2693ac789cce4db51d833886574b

**unarr**

Liu Xiang 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/selmf/unarr/commit/6c0bf9731fd80dbe843d2f546f3be92840613ae1

**syscalls-table**

WANG Xuerui 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/hrw/syscalls-table/commit/599c8a563292e677aaf14a5e51a1039c4a4c108b

## 社区发行版

随着支持 LoongArch 架构的软件逐步开放和完善，一批社区发行版已经在加速开发中:

**Archlinux**

旧版(Alpha): http://archlinux.oukan.online/alpha/bootstrap/archlinux-bootstrap-alpha-2021.06.11-loongarch64.tar.zst

新版：开发中

**AOSC**

https://gitlab.summer-ospp.ac.cn/summer2021/210080299/-/blob/main/README.md

**CLFS**

https://github.com/sunhaiyong1978/CLFS-for-LoongArch

**Gentoo**

自举已经完成，stage3、LiveCD 确认可以工作。请配合 https://github.com/xen0n/loongson-overlay 使用

http://loongson-pub-gz.qnbkt.xen0n.name/stage3-loong-systemd-20211205.tar.xz
http://loongson-pub-gz.qnbkt.xen0n.name/stage3-loong-systemd-20211205.tar.xz.CONTENTS.gz
http://loongson-pub-gz.qnbkt.xen0n.name/stage3-loong-systemd-20211205.tar.xz.DIGESTS

**Loongnix**

desktop: [http://pkg.loongnix.cn:8080/loongnix/isos/](http://pkg.loongnix.cn:8080/loongnix/isos/)

server: http://pkg.loongnix.cn/loongnix-server/8.3/isos/loongarch64/

**OpenAnolis(龙蜥)**

https://mirrors.openanolis.cn/anolis/8.4/isos/BETA/loongarch64/

**OpenEuler(欧拉)**

开发中

注: 本网站为完全开放社区，欢迎广大爱好者通过给 [website](https://github.com/loongarch64/website) 发起 PR 进行投稿！
