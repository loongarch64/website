+++
title = "Upstream first, take the first step"
description = "LoongArch ecological construction started"
date = 2021-01-27T20:35:23+08:00
draft = false
comment = true
toc = false
reward = false
categories = [
  ""
]
tags = [
  "News"
]
+++

With the successful development of the Loongson 3A5000 CPU, a new LoongArch instruction set has been brought. 
The new instruction set means that there is no community support and no software can directly support it.
In order to build an ecosystem, everything must start from scratch. This is an arduous task that requires long-term persistence and investment.

<!--more-->

Fortunately, Loongson has fully realized this problem. Starting from LoongArch, it will adhere to the upstream first strategy, actively participate in community projects with a more open mind, and improve the software ecosystem.

Judging from some signs in the community, Loongson has already begun to merge patches upstream, which is the first step in the upstream priority strategy.

## Binutils

On August 17, 2020, Chenghua Xu sent the first email about LoongArch, requesting to reserve 253~256 Machine numbers for Loongson. After several rounds of communication, the upstream finally allocated 258 to the LoongArch architecture, and in December 2020 Formally merged into the main branch on the 13th.

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4cf2ad720078a9f490dd5b5bc8893a926479196e

## GNU Autotools

GNU Autotools is an important software building kit in the POSIX system, which supports the construction and installation of free software into the running system.

I believe anyone who has played Linux knows the classic Linux software compilation trilogy:


```
./configure
make
make install
```

In the `./configure` phase, Autotools will scan the host system (that is, the currently running computer) for various tests and complete the default settings.

In the testing process, there is a system architecture test. When running in a new architecture that is unfamiliar, `./configure` will report an error and exit, resulting in the inability to complete software compilation.

The two most important architecture-related files are: `config.guess` and `config.sub`.

### config.git

The `config.guess` and `config.sub` in the GNU Autotools package are independently maintained in the [config.git](https://git.savannah.gnu.org/gitweb/?p=config.git;a=summary) repository.

Other software such as gnulib and automake will be obtained from here from time to time and merged into their own code tree. Finally, after upstream developers package them through GNU Autotools, these two files will be released in tarballs.

Xiaotian Wu submitted patches related to the LA architecture, which were merged into the **config.git** master branch on December 22, 2020.

https://git.savannah.gnu.org/gitweb/?p=config.git;a=commitdiff;h=c8ddc8472f8efcadafc1ef53ca1d863415fddd5f

### gnulib

The gnulib code is directly integrated by most software, such as coreutils, grub, etc., and related patches have been pulled from config.git.

https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=6f600ec73085df142211bf8505083dcdd59859bb

https://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=4c30b1b0d2ee72d89069b09f4257c30372c5b5a2


### automake

The automake update is slow. I believe that after pulling the config.git code next time, it will enter the main branch. It is expected that version 1.18 will directly support the LoongArch architecture.

The historical version of automake has been supported by the community and maintained in the following branches. If necessary, you can get it here:

1.16: https://github.com/loongarch64/automake/tree/la64/1.16

1.16.1: https://github.com/loongarch64/automake/tree/la64/1.16.1

1.16.2: https://github.com/loongarch64/automake/tree/la64/1.16.2

1.16.3: https://github.com/loongarch64/automake/tree/la64/1.16.3

Although Loongson has not initiated a merger upstream for some heavyweight software, such as kernel, gcc, binutils, glibc, qemu, etc., but I believe that over time, these software will be merged soon after they are ready to upstream.

To improve the LoongArch ecosystem, a company's manpower and energy are obviously limited. I hope that interested community enthusiasts can participate and jointly build the LoongArch ecosystem.
