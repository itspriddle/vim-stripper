" stripper.vim
" Author:  Joshua Priddle <jpriddle@nevercraft.net>
" URL:     https://github.com/itspriddle/vim-stripper
" Version: 0.1.0
" License: Same as Vim itself (see :help license)

if exists('g:loaded_stripper') || &cp
  finish
endif
let g:loaded_stripper = 1

" Sometimes whitespace isn't evil, such as with markdown.
" Don't strip whitespace on such filetypes when stripping-on-save
if ! exists('g:StripperIgnoreFileTypes')
  let g:StripperIgnoreFileTypes = ['markdown', 'liquid']
endif

" Strip trailing whitespace
function! Stripper#strip(line1, line2)
  execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//e'
endfunction

" Used to strip whitespace when a buffer is saved. This checks that the
" current filetype is not one of g:StripperIgnoreFileTypes. To disable
" add the following to .vimrc:
"
"     let g:StripperNoStripOnSave = 1
function! Stripper#strip_on_save()
  if ! exists('g:StripperNoStripOnSave') && index(g:StripperIgnoreFileTypes, &ft) < 0
    execute ':Stripper'
  endif
endfunction

" Register :Stripper as a vim command
command! -nargs=? -range=% Stripper :call Stripper#strip(<line1>, <line2>)

" Setup autocmds to strip whitespace when a buffer is saved
augroup Stripper
  autocmd!
  autocmd BufWritePre * call Stripper#strip_on_save()
augroup END
