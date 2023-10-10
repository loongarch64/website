+++
title = "网络启动之Grub篇"
description = "使用 Grub 从网络启动系统"
date = 2023-10-10T10:20:00+08:00
author = "武校田"
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

随着龙架构的 UEFI、内核及Grub的快速完善，在龙架构上启动系统已经完全标准化了，本文简要介绍一下使用 Grub 来进行网络启动的方法。

<!--more-->

## 服务器设置

## 制作引导程序

### 方式一

```
$ grub-mknetdir --net-directory /var/ftpd/
已创建用于 loongarch64-efi 的网络引导目录。请配置您的 DHCP 服务器以指向 /var/ftpd/boot/grub/loongarch64-efi/core.efi
```

### 方式二

```
$ cat /tmp/start.cfg
normal (tftp)/boot/grub/grub.cfg

$ grub-mkimage -O loongarch64-efi -o /var/ftpd/grubnetboot.efi --prefix="(tftp)/boot/grub" -c /tmp/start.cfg -v net tftp efinet http blocklist boot configfile linux reboot normal search cat progress lvm part_gpt part_msdos cpio ext2 fat hfs hfsplus iso9660 ntfs tar udf ufs1 ufs2 xfs zfs loopback newc btrfs help halt font loadenv memdisk msdospart terminal zfs zstd zfsinfo xzio
```

注：

方式一生成的整个目录，如果服务器是非 LoongArch 机器，请将此目录完整复制到服务器的 tftp 根目录中。

方式二生成的是一个独立文件，如果服务器是非 LoongArch 机器，只需要将此文件复制到服务器的 tftp 根目录中。

### DHCP、TFTP 服务

dnsmasq 集成了 DHCP 和 TFTP 功能，配置相对简单，大部分 Linux 发行版都可以直接安装。

dnsmasq 配置参考：

```
$ cat /etc/dnsmasq.conf
server=114.114.114.114
interface=enp2s0
listen-address=::1,127.0.0.1,10.10.10.8
expand-hosts
dhcp-range=set:lan,10.10.10.10,10.10.10.30,12h
enable-tftp
tftp-root=/var/ftpd
#以下2行内容，分别对应方式一和方式二生成的引导程序，请根据制作方式选择其中一种
#dhcp-boot=/var/ftpd/boot/grub/loongarch64-efi/core.efi
#dhcp-boot=/var/ftpd/grubnetboot.efi
cache-size=1000
log-queries
```

sudo systemctl restart dnsmasq

## grub 配置

以 Loong Arch Linux 为例来说明网络启动配置，其它发行版，请参考对应的发行版说明文件。

下载内核及initrd文件

```
# mkdir /var/ftpd/boot/
# wget https://mirrors.wsyu.edu.cn/loongarch/archlinux/iso/latest/arch/boot/loong64/vmlinuz-linux
# wget https://mirrors.wsyu.edu.cn/loongarch/archlinux/iso/latest/arch/boot/loong64/initramfs-linux.img
```

grub.cfg 内容

```
# mkdir -p /var/ftpd/boot/grub
# cat /var/ftpd/boot/grub/grub.cfg
set default=0
set timeout=10
set root=(tftp)

menuentry 'PXE Install Archlinux'{
        echo 'Loading Linux kernel...'
        linux /boot/vmlinuz-linux archiso_http_srv=http://mirrors.wsyu.edu.cn/loongarch/archlinux/latest/ archisobasedir=arch ip=dhcp net.ifnames=0 loglevel=7
        echo 'Loading initrd...'
        initrd /boot/initramfs-linux.img
}
```

## 从网络引导系统

龙架构电脑开机，按 `F2` 进入固件设置界面，打开 Http 协议及 PXE 支持，保存并重启。

在 BIOS 的 Logo 显示界面，按 `F12` ，选择从网络启动。
