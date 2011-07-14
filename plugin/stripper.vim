if exists('g:loaded_stripper') || &cp
  finish
endif
let g:loaded_stripper = 1

" Don't strip whitespace on these filetypes
if ! exists('g:StripperIgnoreFileTypes')
  let g:StripperIgnoreFileTypes = ['markdown', 'liquid']
endif

" Strip trailing whitespace before saving
autocmd BufWritePre * call Stripper#strip_on_save()

" Strip trailing white space
function! Stripper#strip(line1, line2)
  if index(g:StripperIgnoreFileTypes, &ft) < 0
    execute ':'. a:line1 .','. a:line2 . 's/\s\+$//e'
  endif
endfunction

function! Stripper#strip_on_save()
  if ! exists('g:StripperNoStripOnSave')
    execute ':Stripper'
  endif
endfunction

command! -nargs=? -range=% Stripper :call Stripper#strip(<line1>, <line2>)
