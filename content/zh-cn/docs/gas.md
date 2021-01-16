+++
title = "GNU 汇编"
description = ""
date = 2021-01-16T19:39:26+08:00
draft = false
comment = true
toc = true
#reward = true
#categories = [
#  ""
#]
#tags = [
#  ""
#]
#series = [
#  ""
#]
+++

GNU汇编程序(as) 2.35版本的用户指南。

本文档根据GNU自由文档许可证的条款分发。许可证的副本包含在标题为“ GNU自由文档许可证”的部分中。

<!--more-->

## 总览

这是有关如何调用as的简要概述。有关详细信息，请参见命令行选项。

as [ **-a** [ **cdghlns** ][=file]] [ **- alternate**] [ **-D** ]

[ **- compress-debug-sections**]  [ **- nocompress-debug-sections**]

[ **- debug-prefix-map** old=new]

[ **- defsym** sym=val] [ **-f** ] [ **-g** ] [ **- gstabs**]

[ **- gstabs+**] [ **- gdwarf-<N>**] [ **- gdwarf-sections**]

[ **- gdwarf-cie-version**=VERSION]

[ **- help**] [ **-I** dir] [ **-J** ]

[ **-K** ] [ **-L** ] [ **- listing-lhs-width**=NUM]

[ **- listing-lhs-width2**=NUM] [ **- listing-rhs-width**=NUM]

[ **- listing-cont-lines**=NUM] [ **- keep-locals**]

[ **- no-pad-sections**]

[ **-o** objfile] [ **-R** ]

[ **- hash-size**=NUM] [ **- reduce-memory-overheads**]

[ **- statistics**]

[ **-v** ] [ **-version** ] [ **- version**]

[ **-W** ] [ **- warn**] [ **- fatal-warnings**] [ **-w** ] [ **-x** ]

[ **-Z** ] [ **@ FILE**]

[ **- sectname-subst**] [ **- size-check=[error|warning]**]

[ **- elf-stt-common=[no|yes]**]

[ **- generate-missing-build-notes=[no|yes]**]

[ **- target-help**] [target-options]

[ **-** |files …]

_Loongarch 目标选项:_

  [ **-mabi** =ABI]


`@file`

    Read command-line options from FILE.  The options read are inserted
    in place of the original @FILE option.  If FILE does not exist, or
    cannot be read, then the option will be treated literally, and not
    removed.

    Options in FILE are separated by whitespace.  A whitespace
    character may be included in an option by surrounding the entire
    option in either single or double quotes.  Any character (including
    a backslash) may be included by prefixing the character to be
    included with a backslash.  The FILE may itself contain additional

    @FILE options; any such options will be processed recursively.
    从file中读取命令行选项。读取的选项将代替原始的@ file选项插入。
    如果文件 不存在或无法读取，则该选项将按字面意义处理，并且不会删除。

    文件中的选项用空格分隔。通过将整个选项括在单引号或双引号中，可以在选项中包括空格字符。
    通过在要包含的字符前面加上反斜杠，可以包含任何字符（包括反斜杠）。
    该文件本身可能包含其他@文件选项；任何此类选项将被递归处理。

`-a[cdghlmns]`

    打开清单输出列表。可以任意使用以下各种方法：

`-ac`

    忽略假(false)的条件

`-ad`

    忽略调试(debugging)指令

`-ag`

    包括一般(general)信息，例如版本和传递的选项

`-ah`

    包括高级(high-level)语言的源代码

`-al`

    包括汇编(assembly)代码

`-am`

    包括宏(macro)扩展

`-an`

    忽略格式(forms)处理过程

`-as`

    包含符号表(symbols)

`=file`

    设置清单文件的名称

您可以组合使用这些选项：例如，不经过格式(forms)处理的汇编代码清单使用 '-aln' 。

如果要使用 `=file` 选项，它必须在最后一个位置。选项 `-a` 单独使用时，缺省含义是 `-ahls`。

`--alternate`

    Begin in alternate macro mode.  *Note '.altmacro': Altmacro.
    从备用宏模式开始。请参阅 [`.altmacro`](Altmacro.html#Altmacro).

`--compress-debug-sections`

    
    Compress DWARF debug sections using zlib with SHF_COMPRESSED from
    the ELF ABI. The resulting object file may not be compatible with
    older linkers and object file utilities.  Note if compression would
    make a given section _larger_ then it is not compressed.
    使用zlib和ELF ABI的SHF_COMPRESSED压缩DWARF调试节。
    生成的目标文件可能与较旧的链接器和目标文件实用程序不兼容。
    注意，如果压缩会使给定的部分 _变大_，则它不会被压缩。

`--compress-debug-sections=none`

`--compress-debug-sections=zlib`

`--compress-debug-sections=zlib-gnu`

`--compress-debug-sections=zlib-gabi`

    These options control how DWARF debug sections are compressed.
    '--compress-debug-sections=none' is equivalent to
    '--nocompress-debug-sections'.  '--compress-debug-sections=zlib'
    and '--compress-debug-sections=zlib-gabi' are equivalent to
    '--compress-debug-sections'.  '--compress-debug-sections=zlib-gnu'
    compresses DWARF debug sections using zlib.  The debug sections are
    renamed to begin with '.zdebug'.  Note if compression would make a
    given section _larger_ then it is not compressed nor renamed.

    这些选项控制DWARF调试节的压缩方式。
    --compress-debug-sections=none 相当于 --nocompress-debug-sections。
    --compress-debug-sections=zlib 和 --compress-debug-sections=zlib-gabi 
    相当于 --compress-debug-sections。
    --compress-debug-sections=zlib-gnu使用zlib压缩DWARF调试部分。调试部分重命名为以 '.zdebug'。
    请注意，如果压缩会使给定的部分 _变大_，则它不会被压缩或重命名。

`--nocompress-debug-sections`

    Do not compress DWARF debug sections.  This is usually the default
    for all targets except the x86/x86_64, but a configure time option
    can be used to override this.

    不要压缩DWARF调试部分。对于除 x86/x86_64 之外的所有目标，
    这通常是默认设置，但是可以使用配置时的选项可以覆盖它。

`-D`

    忽略。接受此选项是为了使脚本与其他汇编程序的调用兼容。

`--debug-prefix-map old=new`

    When assembling files in directory 'OLD', record debugging
    information describing them as in 'NEW' instead.

    当汇编源文件位于 'old' 目录中时，记录描述它们的调试信息，如同在 'new' 目录中一样。

`--defsym sym=value`

    在处理输入文件之前，将符号 sym 定义为 value 。 value 必须是整型常量。
    与C语言中一样，前导字符 '0x' 表示十六进制值，前导字符 '0' 表示八进制值。
    可通过使用 '.set' 伪操作在源文件中覆盖符号的值。

`-f`

    快速(fast)处理 --- 跳过空白和注释预处理（假定输入源文件是编译器的输出）。

`-g`

`--gen-debug`

    Generate debugging information for each assembler source line using
    whichever debug format is preferred by the target.  This currently
    means either STABS, ECOFF or DWARF2.  When the debug format is
    DWARF then a '.debug_info' and '.debug_line' section is only
    emitted when the assembly file doesn't generate one itself.

    使用目标首选的任何调试格式为每个汇编程序源代码行生成调试信息。
    当前这意味着STABS，ECOFF或DWARF2 调试格式之一。

`--gstabs`

    生成逐行的 stabs 格式调试信息。如果调试器可以处理这种格式的信息，则有助于汇编代码的调试。

`--gstabs+`

    Generate stabs debugging information for each assembler line, with
    GNU extensions that probably only gdb can handle, and that could
    make other debuggers crash or refuse to read your program.  This
    may help debugging assembler code.  Currently the only GNU
    extension is the location of the current working directory at
    assembling time.

    使用可能只有gdb可以处理的GNU扩展，为每个汇编器行生成stab调试信息，
    这可能会使其他调试器崩溃或拒绝读取程序。这可能有助于调试汇编代码。
    当前，唯一的GNU扩展名是组装时当前工作目录的位置。

`--gdwarf-2`

    Generate DWARF2 debugging information for each assembler line.
    This may help debugging assembler code, if the debugger can handle
    it.  Note--this option is only supported by some targets, not all
    of them.

    为每个汇编器行生成DWARF2调试信息。如果调试器可以处理汇编代码，则这
    可能有助于调试。注意-此选项仅受某些目标支持，而并非所有目标都支持。

`--gdwarf-3`

    This option is the same as the '--gdwarf-2' option, except that it
    allows for the possibility of the generation of extra debug
    information as per version 3 of the DWARF specification.  Note -
    enabling this option does not guarantee the generation of any extra
    infortmation, the choice to do so is on a per target basis.

    此选项与 --gdwarf-2 选项相同，除了它允许根据DWARF规范的版本3生成额外
    的调试信息。注意-启用此选项并不能保证会产生任何额外的激励，因此可以根据每个目标进行选择。

`--gdwarf-4`

    This option is the same as the '--gdwarf-2' option, except that it
    allows for the possibility of the generation of extra debug
    information as per version 4 of the DWARF specification.  Note -
    enabling this option does not guarantee the generation of any extra
    infortmation, the choice to do so is on a per target basis.

    此选项与 --gdwarf-2 选项相同，除了它允许根据DWARF规范的版本4生成额外
    的调试信息。注意-启用此选项并不能保证会产生任何额外的激励，因此可以根据每个目标进行选择。

`--gdwarf-5`

    This option is the same as the '--gdwarf-2' option, except that it
    allows for the possibility of the generation of extra debug
    information as per version 5 of the DWARF specification.  Note -
    enabling this option does not guarantee the generation of any extra
    infortmation, the choice to do so is on a per target basis.

    此选项与 --gdwarf-2 选项相同，除了它允许根据DWARF规范的版本5生成额外的调试信息。
    注意-启用此选项并不能保证会产生任何额外的激励，因此可以根据每个目标进行选择。

`--gdwarf-sections`

    Instead of creating a .debug_line section, create a series of
    .debug_line.FOO sections where FOO is the name of the corresponding
    code section.  For example a code section called .TEXT.FUNC will
    have its dwarf line number information placed into a section called
    .DEBUG_LINE.TEXT.FUNC.  If the code section is just called .TEXT
    then debug line section will still be called just .DEBUG_LINE
    without any suffix.

    而不是创建.debug_line部分，而是创建一系列.debug_line.foo节，其中foo是相应代码节的名称。
    例如，一个名为.text.func的代码段 会将其侏儒行号信息放入一个名为.debug_line.text.func的段中。
    如果仅将代码段称为.text， 则调试行段仍将仅称为.debug_line，不带任何后缀。

`--gdwarf-cie-version=version`

    Control which version of DWARF Common Information Entries (CIEs)
    are produced.  When this flag is not specificed the default is
    version 1, though some targets can modify this default.  Other
    possible values for VERSION are 3 or 4.

    控制生成哪个版本的DWARF公共信息条目（CIEs）。
    未指定此标志时，默认值为版本1，尽管某些目标可以修改此默认值。
    版本的其他可能值为3或4。

`--size-check=error`

`--size-check=warning`

    针对无效的 ELF .size 指令发出错误或警告。

`--elf-stt-common=no`

`--elf-stt-common=yes`

    These options control whether the ELF assembler should generate
    common symbols with the 'STT_COMMON' type.  The default can be
    controlled by a configure option '--enable-elf-stt-common'.

    这些选项控制ELF汇编程序是否应使用 STT_COMMON 类型生成公共符号。
    默认值可以由 --enable-elf-stt-common 配置选项控制。

`--generate-missing-build-notes=yes`

`--generate-missing-build-notes=no`

    These options control whether the ELF assembler should generate GNU
    Build attribute notes if none are present in the input sources.
    The default can be controlled by the
    '--enable-generate-build-notes' configure option.

    如果输入源中是none，则这些选项控制ELF汇编器是否应生成GNU Build属性注释。
    默认值可以由 --enable-generate-build-notes 配置选项。


`--help`

    打印命令行选项摘要并退出。

`--target-help`

    打印所有目标特定选项的摘要并退出。

`-I dir`

    将目录dir添加到.include指令的搜索列表中。

`-J`

	不要警告符号(signed)溢出。

`-K`

	Issue warnings when difference tables altered for long displacements.
	当差值表更改为长位移时，发出警告。
	长跳切换表时发出警告。

`-L`

`--keep-locals`

	Keep (in the symbol table) local symbols. These symbols start with system-
	specific local label prefixes, typically '.L' for ELF systems or 'L' for
	traditional a.out systems. See [Symbol Names](Symbol-Names.html#Symbol-Names).
	保留（符号表中的）局部符号。这些符号以系统特定的局部标签前缀开头。
	通常在ELF格式中为为'.L'，传统的a.out格式中为'L'。请参见符号名称。

`--listing-lhs-width=number`

    Set the maximum width, in words, of the output data column for an assembler
	listing to number.
	将汇编程序列表的输出数据列的最大宽度（以字为单位）设置为number。

`--listing-lhs-width2=number`

    Set the maximum width, in words, of the output data column for continuation
	lines in an assembler listing to number.
	将汇编程序列表中连续行的输出数据列的最大宽度（以字为单位）设置为number。

`--listing-rhs-width=number`

    Set the maximum width of an input source line, as displayed in a listing, to
	number bytes.
	将清单中显示的输入源行的最大宽度设置为 数字字节。

`--listing-cont-lines=number`

    Set the maximum number of lines printed in a listing for a single line of
	input to number \+ 1.
	将清单中单行输入的最大行数设置为number + 1。

`--no-pad-sections`

	Stop the assembler for padding the ends of output sections to the alignment of
	that section. The default is to pad the sections, but this can waste space
	which might be needed on targets which have tight memory constraints.
	停止汇编程序，以将输出节的末端填充到该节的对齐位置。默认设置是填充这些节，但这会浪费空间，而这对于具有严格内存限制的目标可能是必需的。
	
`-o objfile`

	指定输出的目标文件名。

`-R`

	将来自数据部分(data section)的代码放置(fold)到文本部分(text section)。

`--hash-size=number`

	Set the default size of GAS's hash tables to a prime number close to number.
	Increasing this value can reduce the length of time it takes the assembler to
	perform its tasks, at the expense of increasing the assembler's memory
	requirements. Similarly reducing this value can reduce the memory requirements
	at the expense of speed.
	将GAS哈希表的默认大小设置为接近number的素 数。增加此值可以减少汇编程序执行任务所需的时间，但会增加汇编程序的内存要求。同样，减小此值可以减少内存需求，但会降低速度。

`--reduce-memory-overheads`

	This option reduces GAS's memory requirements, at the expense of making the
	assembly processes slower. Currently this switch is a synonym for '\--hash-
	size=4051', but in the future it may have other effects as well.
	此选项降低了GAS的内存要求，但以使组装过程更慢为代价。目前，此开关是“--hash-size = 4051”，但将来也可能会产生其他影响。

`--sectname-subst`

	Honor substitution sequences in section names. See [`.section name`](Section.html#Section-Name-Substitutions).
	部分名称中的荣誉替换顺序。请参阅。 .section name

`--statistics`

	打印汇编过程中使用的最大空间（字节）和总时间（秒）。

`--strip-local-absolute`

	从输出符号表中删除局部绝对符号。

`-v`

`-version`

	打印as的版本。

`--version`

	打印as的版本并退出。

`-W`

`--no-warn`

	禁止显示警告消息。

`--fatal-warnings`

	将警告视为错误。

`--warn`

	不要禁止警告消息或将其视为错误。

`-w`

	已被忽略。

`-x`

	已被忽略。

`-Z`

	即使发生错误也要生成目标文件。

`-- | files …`

	标准输入或要汇编的源文件。

以下选项，当配置 as 为 Loongarch 处理器时有效。

略...

## 命令行选项

## 句法

## 节和重定位

## 符号

## 表达式

## 汇编程序指令

## 对象属性

## Loongarch相关功能
