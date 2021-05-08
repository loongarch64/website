+++
title = "2021年一季度社区动态"
description = "2021年一季度社区动态"
date = 2021-05-08T12:35:00+08:00
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

2021年一季度，上游社区陆续合并了file、meson、cmake的LoongArch补丁。

<!--more-->

## meson

Meson（The Meson Build System）是个项目构建系统，语法设计简单、清晰、简洁，用户友好、编译速度快（使用ninja)，提供了更多现代特性，如单元测试（unit testing）、代码覆盖率报告（code coverage reporting）、头文件预编译（precompiled headers），交叉编译，众多语言和开发框架支持等，大量的社区项目已采用 meson 来做为构建系统。

对LoongArch的支持补丁已[提交](https://github.com/mesonbuild/meson/pull/8300)上游社区，从2月15日发布的 [meson-0.57.0](https://github.com/mesonbuild/meson/releases/tag/0.57.0) 版本开始已经默认支持LoongArch架构。

## file

file 是Linux/Unix 系统中的常用命令，用来识别文件类型，文件编码等信息。

LoongArch架构的可执行文件，由于不被支持，因此查看文件类型时，会显示为 **unknown arch**。

```
$ file /bin/ls
/bin/ls: ELF 64-bit LSB pie executable, *unknown arch 0x102* version 1 (SYSV), dynamically linked, interpreter /lib64/ld.so.1, for GNU/Linux 4.15.0, BuildID[sha1]=6e2d68b5bdd6ac78429a85a13c89b52eba76fb3d, stripped
```

Xiaotian Wu 提交的[补丁](https://github.com/file/file/pull/103)，希望可以显示为 **LoongArch**:

```
$ file /bin/ls
/bin/ls: ELF 64-bit LSB pie executable, LoongArch, version 1 (SYSV), dynamically linked, interpreter /lib64/ld.so.1, for GNU/Linux 4.15.0, BuildID[sha1]=6e2d68b5bdd6ac78429a85a13c89b52eba76fb3d, stripped

```

而在 file 维护者参考上游 binutils-gdb 仓库做了一番[id更新](https://github.com/file/file/commit/b22b7780034cf845bbdf4beeab15e69e494a2001) 操作之后，最终显示为 **Loongson Loongarch**：

```
$ file /bin/ls
/bin/ls: ELF 64-bit LSB pie executable, Loongson Loongarch, version 1 (SYSV), dynamically linked, interpreter /lib64/ld.so.1, for GNU/Linux 4.15.0, BuildID[sha1]=6e2d68b5bdd6ac78429a85a13c89b52eba76fb3d, stripped

```

3月31日发布的 [file-40](https://github.com/file/file/releases/tag/FILE5_40) 版本已经支持LoongArch架构。

## cmake

CMake是个一个开源的跨平台自动化构建系统，是用来管理软件构建的程序，不依赖于特定编译器，可支持多层目录、多个应用程序与多个库。

对LoongArch的支持[补丁](https://gitlab.kitware.com/utils/kwiml/-/merge_requests/4)已[提交](https://gitlab.kitware.com/cmake/cmake/-/merge_requests/6032)上游，预计最早将于 [3.20.2](https://gitlab.kitware.com/cmake/cmake/-/milestones/88) 版本中对外发布。
