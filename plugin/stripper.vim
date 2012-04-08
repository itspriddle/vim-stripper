" stripper.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" URL:     https://github.com/itspriddle/vim-stripper
" Version: 0.2.1
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

" Used to strip whitespace when a buffer is saved. This checks that the
" current filetype is not one of g:StripperIgnoreFileTypes. To disable
" add the following to .vimrc:
"
"     let g:StripperNoStripOnSave = 1
function! s:strip_on_save()
  if ! exists('g:StripperNoStripOnSave') && index(g:StripperIgnoreFileTypes, &ft) < 0
    execute ':Stripper'
  endif
endfunction

" Register :Stripper as a vim command
command! -range=% Stripper execute '<line1>,<line2>s/\s\+$//e'

" Setup autocmds to strip whitespace when a buffer is saved
augroup Stripper
  autocmd!
  autocmd BufWritePre * call <SID>strip_on_save()
augroup END
