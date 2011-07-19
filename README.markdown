# stripper.vim

`stripper.vim` won't get naked for you, but it will strip trailing whitespace.

## Overview

`stripper.vim` adds the `:Stripper` command, which will strip trailing
whitespace from your files. By default, all files but Markdown and Liquid are
stripped when a buffer is saved. This behavior is configurable. See
`:help stripper` for more info.

While editing a document, you can use the command `:Stripper` to strip
whitespace manually.

Strip all whitespace in the current buffer:

    :Stripper

Strip whitespace on lines 3-5 of the current buffer:

    :3,5Stripper

You can also strip whitespace on selected text in visual mode.

## License

Same as Vim itself, see `:help license`.
