+++
title = "2021年四季度社区动态"
linktitle = "2021年四季度社区动态"
description = "2021年四季度社区动态"
date = 2022-01-25T14:35:00+08:00
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

2021年四季度，LoongArch 平台开发者手册开放更新中；基础软件、开发语言、系统软件继续稳步推进。

## 开发者手册

[LoongArch Processor SMBIOS Spec](https://loongson.github.io/LoongArch-Documentation/LoongArch-Processor-SMBIOS-Spec-EN.html): 为上游 SMBIOS 规范增加 LoongArch 处理器部分，预计在 V3.6.0 版本将合并到上游。

以上手册作为开发者必备的参考资料，同时也是指导工具链实现的规范，目前在社区开放讨论并持续更新中， https://github.com/loongson/LoongArch-Documentation

## 基础软件

### QEMU

WANG Xuerui 提交的 LoongArch TCG host 支持补丁上游已合并。

https://patchew.org/QEMU/20211221054105.178795-1-git@xen0n.name/

## 开发语言

### golang

limeidan 和 liuxiaodong 提交的 golang/net 补丁上游已合并。

https://github.com/golang/net/commit/d55c255bac037b8052cb2cb906e2a42ef152ff79

## 系统软件

### beetle-pce-fast-libretro

fyl 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/libretro/beetle-pce-fast-libretro/commit/eb57e0c21f082de9f0ba86f26b3c716a2ed18b14

### benchmark

huajingyun 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/google/benchmark/commit/f90215f1cc2c22d32d96e903ea031278681e4adb

### chromium

Zhao Jiazhong 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/chromium/chromium/commit/8f1041be06763964d54b6bfac7faa751569b4a48

### ffmpeg

guxiwei、yin shiyou、Hao Chen、Jin Bo 等人提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/FFmpeg/FFmpeg/commit/024e934480a34ff534020f1617c94a7212f88a0f
https://github.com/FFmpeg/FFmpeg/commit/07f8f78a5fb8b6a28f7b9d79fae6e411a17114ee
https://github.com/FFmpeg/FFmpeg/commit/1ccc45896096b39b9a0d5650618d384df30d15e4
https://github.com/FFmpeg/FFmpeg/commit/2fd914e079645ad08a4068b46c161f4a01b5b996
https://github.com/FFmpeg/FFmpeg/commit/3f294ec8799390af0bfc6916c312e5b1e0035c10
https://github.com/FFmpeg/FFmpeg/commit/555b850bd56c87007c6b7b02dbb1e474e9911dfa
https://github.com/FFmpeg/FFmpeg/commit/5d58355bf1a7bd07b0f08bf1f90f4aba8b89d727
https://github.com/FFmpeg/FFmpeg/commit/5ff58b77bb1f44a2074967cb0e0b7db3b437df10
https://github.com/FFmpeg/FFmpeg/commit/6038a9eb92b2daac907c941dbb245ed43c350501
https://github.com/FFmpeg/FFmpeg/commit/72bcbe216ef3d47498392ed2bada83994cd9fc86
https://github.com/FFmpeg/FFmpeg/commit/8ca7d474c19f856b28fa588e040b23b1a58368ed
https://github.com/FFmpeg/FFmpeg/commit/8ca7d474c19f856b28fa588e040b23b1a58368ed
https://github.com/FFmpeg/FFmpeg/commit/9a840ffa176038d44e0197283590f891b2cf9eeb
https://github.com/FFmpeg/FFmpeg/commit/afcb36b7e54727d533b45303b36fa0d13ce02797
https://github.com/FFmpeg/FFmpeg/commit/cba7c0267dad3963ff52f146012dd99fd5b55c2c
https://github.com/FFmpeg/FFmpeg/commit/df46d7cb49ce301d83c1d20cfc4ef47390d47691
https://github.com/FFmpeg/FFmpeg/commit/fea299f8768adbbddcb5b26a34f622a8606945a6

ffmpeg 5.0 版本已经增加了 LoongArch 架构，参见 Changelog:

https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/Changelog

### jnr-constants

shanjiantao 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/jnr/jnr-constants/commit/413ff6e502c86edda2ebae9f8689e2b9c462e743

jnr-constants 0.10.2 版本已经增加了 LoongArch 架构

### libffcall

https://git.savannah.gnu.org/gitweb/?p=libffcall.git;a=commit;h=600d713cd18f09a698f937ff6c2cead41036e3da

### libunwind

Tiezhu Yang、 Qing Zhang、 Jinyang He、 Youling Tang 等人提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/libunwind/libunwind/commit/c5f1d12c77dea6a60740730c675fc56b3c52b86a

### libyuv

Hao Chen 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/noiseless/libyuv/commit/2f87e9a7135b83656c86b3b23ba582e0dfeb7fbb
https://github.com/noiseless/libyuv/commit/f8e2da48aed24a7b2608172aa5e59421f1f802d4
https://github.com/noiseless/libyuv/commit/dfe046d27255cff06fc4cfe42c6d373fd83bc2aa
https://github.com/noiseless/libyuv/commit/de8ae8c679f5a42fb9f9f65318d6cb95112180d6
https://github.com/noiseless/libyuv/commit/51de1e16f20bb93468d7c538629b40ece8420b71

### Nim

wenghongquan 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/nim-lang/Nim/commit/742e9d65ad6b56387dc6bf9a2be1b95c510fd0c4

### NodeJS

Shi Pujin 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/nodejs/node/commit/81e88f27b7199bafc9e26bb1def2d06bac2b9fad

### NumPy

NumPy 1.22.0 版本已经支持 LoongArch 架构，参见 Release Notes:

https://numpy.org/doc/stable/release/1.22.0-notes.html

### ode

zhangna 提交的 LoongArch 架构支持补丁上游已合并。

https://bitbucket.org/odedevs/ode/commits/04f4c2d33f4abcb2970e8377d1a35e06c6ff3504

### OpenBLAS

gxw 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/xianyi/OpenBLAS/commit/af0a69f355a086d70cc08ccda8bde7a48b3133c4

OpenBLAS 0.3.18 版本已经支持 LoongArch 架构，参见 Release Notes:

https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.18

### OpenH264

jinboson、Lu Wang 等人提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/cisco/openh264/commit/a8094d85f5dd5ef112fbcfec2974e18fd0387c0b

### patchelf

zhangwenlong 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/NixOS/patchelf/commit/a174cf3006baf31e0e9eaa62bc9adead93af63f7

### pwsafe

Yaling Fang 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/pwsafe/pwsafe/commit/faf1545c3c0327fb5e7c84502146014d1550cb50

### pyroute2

zhangwenlong 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/svinota/pyroute2/commit/6fdae02ff0666c11e726166e296d67c75782587b

### strace

WANG Xuerui 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/strace/strace/commit/2bf68c3b08ba82f4f41035e58149c06d2421cbd6
https://github.com/strace/strace/commit/665f7bb525b2a800257af5d3d83b796e6cd9ddbe
https://github.com/strace/strace/commit/819a2c5ff74e8fd957d36ae1e70cb87f02d2b9b6

### stringi

liuxiang88 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/gagolews/stringi/commit/23b92c604c2bb48cc5b6a241e4875182c5889aeb

### systemd

Wu Xiaotian 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/systemd/systemd/commit/646b01121a9cf2009768af2dac080940b9803624
https://github.com/systemd/systemd/commit/ff6d286902b4330a07e0d4a141751344257ef0c1
https://github.com/systemd/systemd/commit/eebbd595f0de9505f4df3c3460ab36d46d8262f8
https://github.com/systemd/systemd/commit/89f60c217c3f095db8e530c63fcb761fd64dc2d4
https://github.com/systemd/systemd/commit/0444a6e4be6bdc4d57076609f182497ea79aa7b5

systemd 250 版本已经初步增加了 LoongArch 架构，参见 Release Notes:

https://github.com/systemd/systemd/releases/tag/v250

### tilibs

suntie 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/debrouxl/tilibs/commit/3447f6e786b377f2eb5c40cc840024098633a9e0

### tup

Yaling Fang 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/gittup/tup/commit/324d0cd97b0d78566f19f0b30cb072eddeabd99d

### unarr

liuxiang88 提交的 LoongArch 架构支持补丁上游已合并。

https://github.com/selmf/unarr/commit/a9c2c6f71ad3ad5f3fd0bfed2b06148b51ed7555

注: 本网站为完全开放社区，欢迎广大爱好者通过为 [website](https://github.com/loongarch64/website) 发起 PR 进行投稿！
