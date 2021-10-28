+++
title = "Hello World 汇编"
author = ""
description = ""
date = 2021-10-28T14:48:54+08:00
draft = false
comment = true
toc = true
reward = true
categories = [
  ""
]
tags = [
  ""
]
series = [
  ""
]
images = [
  ""
]
+++

LoongArch 工具链和内核代码已经完全开放，借助 Qemu 已经可以开始学习 LoongArch 汇编语言了。

<!--more-->

# 工具链安装

x86_64 Archlinux 上的预编译工具链及模拟器已经提供。

```
wget https://github.com/yetist/build-tools/releases/download/v2021.10.24/loongarch64-linux-gnu-linux-api-headers-5.15.0.r1044054.g4d7f11bd5339-1-any.pkg.tar.xz
wget https://github.com/yetist/build-tools/releases/download/v2021.10.24/loongarch64-linux-gnu-binutils-2.37.r107028.g6672b06b122-1-x86_64.pkg.tar.xz
wget https://github.com/yetist/build-tools/releases/download/v2021.10.24/loongarch64-linux-gnu-gcc-12.0.0.r185552.g14cdc0fc6a6-1-x86_64.pkg.tar.xz
wget https://github.com/yetist/build-tools/releases/download/v2021.10.24/qemu-loongarch64-6.1.0.r91240.g59a245bd54-1-x86_64.pkg.tar.zst

sudo pacman -U *loongarch64*
```

如果要自行制作交叉编译工具链，可参考[打包脚本]() 或 [CLFS 教程]()

## C 语言

`hello.c` 源码：

```c
#include <stdio.h>

int main(int argc, char** argv)
{
    printf("hello, world!\n");
    return 0;
}
```

编译及运行：

```bash
$ loongarch64-linux-gnu-gcc hello.c -o hello
$ ./hello
hello, world!
$
```

## C++ 语言

`hello.cpp` 源码：

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World!" << std::endl;
    return 0;
}
```

编译及运行：

```bash
$ loongarch64-linux-gnu-g++ hello.cpp -o hello2
$ ./hello2
hello, world!
$
```

## 汇编语言

`hello.S` 汇编源代码：

```asm
.section .rodata
msg:
    .string "hello, world!\n"
    len = . - msg                    # 字串长度

.text
    .globl  _start
_start:
    li.w          $a2, 0xf            # len(msg) = 0xf
    la.local      $a1, msg
    li.w          $a0, 1              # stdout=1, stderr=2
    li.w          $a7, 64
    syscall       0x0

    li.w          $a0, 0x0
    li.w          $a7, 93
    syscall       0x0
```

编译及运行：

```bash
loongarch64-linux-gnu-as -o hello.o hello.S
loongarch64-linux-gnu-ld -o hello3 hello.o
$ ./hello3
hello, world!
$
```

注：目前由于binutils功能支持不完整，导致以下汇编代码无法编译。

`hello2.S` 汇编源代码：

```asm
.equ STDOUT     1
.equ __NR_write 64
.equ __NR_exit  93

.section .rodata
msg:
    .string "hello, world!\n"
    len = . - msg                   # 字符串长度

.text
    .globl  _start
_start:
    li.w          $a2, len
    la.local      $a1, msg
    li.w          $a0, STDOUT
    li.w          $a7, __NR_write
    syscall       0x0

    li.w          $a0, 0x0
    li.w          $a7, __NR_exit
    syscall       0x0
```
