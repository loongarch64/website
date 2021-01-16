+++
title = "GNU as user guide"
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

This file is a user guide to the GNU assembler as (GNU Binutils) version 2.35.

This document is distributed under the terms of the GNU Free Documentation License. A copy of the license is included in the section entitled “GNU Free Documentation License”.

<!--more-->

## Overview

Here is a brief summary of how to invoke `as`. For details, see Command-Line Options.

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
  
_Target Loongarch options:_


  [ **-mabi** =ABI]

  

`@file`

    Read command-line options from file. The options read are inserted in place of
    the original @file option. If file does not exist, or cannot be read, then the
    option will be treated literally, and not removed.

    Options in file are separated by whitespace. A whitespace character may be
    included in an option by surrounding the entire option in either single or
    double quotes. Any character (including a backslash) may be included by
    prefixing the character to be included with a backslash. The file may itself
    contain additional @file options; any such options will be processed
    recursively.

`-a[cdghlmns]`

    Turn on listings, in any of a variety of ways:

`-ac`

    omit false conditionals

`-ad`

    omit debugging directives

`-ag`

    include general information, like as version and options passed

`-ah`

    include high-level source

`-al`

    include assembly

`-am`

    include macro expansions

`-an`

    omit forms processing

`-as`

    include symbols

`=file`

    set the name of the listing file

    You may combine these options; for example, use '-aln' for assembly listing
    without forms processing. The '=file' option, if used, must be the last one.
    By itself, '-a' defaults to '-ahls'.

`--alternate`

    Begin in alternate macro mode. See [`.altmacro`](Altmacro.html#Altmacro).

`--compress-debug-sections`

    Compress DWARF debug sections using zlib with SHF_COMPRESSED from the ELF ABI.
    The resulting object file may not be compatible with older linkers and object
    file utilities. Note if compression would make a given section _larger_ then
    it is not compressed.

`--compress-debug-sections=none`

`--compress-debug-sections=zlib`

`--compress-debug-sections=zlib-gnu`

`--compress-debug-sections=zlib-gabi`

    These options control how DWARF debug sections are compressed. \--compress-
    debug-sections=none is equivalent to \--nocompress-debug-sections.
    \--compress-debug-sections=zlib and \--compress-debug-sections=zlib-gabi are
    equivalent to \--compress-debug-sections. \--compress-debug-sections=zlib-gnu
    compresses DWARF debug sections using zlib. The debug sections are renamed to
    begin with '.zdebug'. Note if compression would make a given section _larger_
    then it is not compressed nor renamed.

`--nocompress-debug-sections`

    Do not compress DWARF debug sections. This is usually the default for all
    targets except the x86/x86_64, but a configure time option can be used to
    override this.

`-D`

    Ignored. This option is accepted for script compatibility with calls to other
    assemblers.

`--debug-prefix-map old=new`

    When assembling files in directory old, record debugging information
    describing them as in new instead.

`--defsym sym=value`

    Define the symbol sym to be value before assembling the input file. value must
    be an integer constant. As in C, a leading '0x' indicates a hexadecimal value,
    and a leading '0' indicates an octal value. The value of the symbol can be
    overridden inside a source file via the use of a `.set` pseudo-op.

`-f`

    "fast"--skip whitespace and comment preprocessing (assume source is compiler output).

`-g`

`--gen-debug`

    Generate debugging information for each assembler source line using whichever
    debug format is preferred by the target. This currently means either STABS,
    ECOFF or DWARF2.

`--gstabs`

    Generate stabs debugging information for each assembler line. This may help
    debugging assembler code, if the debugger can handle it.

`--gstabs+`

    Generate stabs debugging information for each assembler line, with GNU
    extensions that probably only gdb can handle, and that could make other
    debuggers crash or refuse to read your program. This may help debugging
    assembler code. Currently the only GNU extension is the location of the
    current working directory at assembling time.

`--gdwarf-2`

    Generate DWARF2 debugging information for each assembler line. This may help
    debugging assembler code, if the debugger can handle it. Note--this option is
    only supported by some targets, not all of them.

`--gdwarf-3`

    This option is the same as the \--gdwarf-2 option, except that it allows for
    the possibility of the generation of extra debug information as per version 3
    of the DWARF specification. Note - enabling this option does not guarantee the
    generation of any extra infortmation, the choice to do so is on a per target
    basis.

`--gdwarf-4`

    This option is the same as the \--gdwarf-2 option, except that it allows for
    the possibility of the generation of extra debug information as per version 4
    of the DWARF specification. Note - enabling this option does not guarantee the
    generation of any extra infortmation, the choice to do so is on a per target
    basis.

`--gdwarf-5`

    This option is the same as the \--gdwarf-2 option, except that it allows for
    the possibility of the generation of extra debug information as per version 5
    of the DWARF specification. Note - enabling this option does not guarantee the
    generation of any extra infortmation, the choice to do so is on a per target
    basis.

`--gdwarf-sections`

    Instead of creating a .debug_line section, create a series of .debug_line.foo
    sections where foo is the name of the corresponding code section. For example
    a code section called .text.func will have its dwarf line number information
    placed into a section called .debug_line.text.func. If the code section is
    just called .text then debug line section will still be called just
    .debug_line without any suffix.

`--gdwarf-cie-version=version`

    Control which version of DWARF Common Information Entries (CIEs) are produced.
    When this flag is not specificed the default is version 1, though some targets
    can modify this default. Other possible values for version are 3 or 4.

`--size-check=error`

`--size-check=warning`

    Issue an error or warning for invalid ELF .size directive.

`--elf-stt-common=no`

`--elf-stt-common=yes`

    These options control whether the ELF assembler should generate common symbols
    with the `STT_COMMON` type. The default can be controlled by a configure
    option \--enable-elf-stt-common.

`--generate-missing-build-notes=yes`

`--generate-missing-build-notes=no`

    These options control whether the ELF assembler should generate GNU Build
    attribute notes if none are present in the input sources. The default can be
    controlled by the \--enable-generate-build-notes configure option.

`--help`

    Print a summary of the command-line options and exit.

`--target-help`

    Print a summary of all target specific options and exit.

`-I dir`

    Add directory dir to the search list for `.include` directives.

`-J`

    Don't warn about signed overflow.

`-K`

    Issue warnings when difference tables altered for long displacements.

`-L`

`--keep-locals`

    Keep (in the symbol table) local symbols. These symbols start with system-
    specific local label prefixes, typically '.L' for ELF systems or 'L' for
    traditional a.out systems. See [Symbol Names](Symbol-Names.html#Symbol-Names).

`--listing-lhs-width=number`

    Set the maximum width, in words, of the output data column for an assembler
    listing to number.

`--listing-lhs-width2=number`

    Set the maximum width, in words, of the output data column for continuation
    lines in an assembler listing to number.

`--listing-rhs-width=number`

    Set the maximum width of an input source line, as displayed in a listing, to
    number bytes.

`--listing-cont-lines=number`

    Set the maximum number of lines printed in a listing for a single line of
    input to number \+ 1.

`--no-pad-sections`

    Stop the assembler for padding the ends of output sections to the alignment of
    that section. The default is to pad the sections, but this can waste space
    which might be needed on targets which have tight memory constraints.
`-o objfile`

    Name the object-file output from `as` objfile.

`-R`

    Fold the data section into the text section.

`--hash-size=number`

    Set the default size of GAS's hash tables to a prime number close to number.
    Increasing this value can reduce the length of time it takes the assembler to
    perform its tasks, at the expense of increasing the assembler's memory
    requirements. Similarly reducing this value can reduce the memory requirements
    at the expense of speed.

`--reduce-memory-overheads`

    This option reduces GAS's memory requirements, at the expense of making the
    assembly processes slower. Currently this switch is a synonym for '\--hash-
    size=4051', but in the future it may have other effects as well.

`--sectname-subst`

    Honor substitution sequences in section names. See [`.section
    name`](Section.html#Section-Name-Substitutions).

`--statistics`

    Print the maximum space (in bytes) and total time (in seconds) used by
    assembly.

`--strip-local-absolute`

    Remove local absolute symbols from the outgoing symbol table.

`-v`

`-version`

    Print the `as` version.

`--version`

    Print the `as` version and exit.

`-W`

`--no-warn`

    Suppress warning messages.

`--fatal-warnings`

    Treat warnings as errors.

`--warn`

    Don't suppress warning messages or treat them as errors.

`-w`

    Ignored.

`-x`

    Ignored.

`-Z`

    Generate an object file even after errors.

`-- | files …`

    Standard input, or source files to assemble.

