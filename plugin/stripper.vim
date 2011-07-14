if exists('g:loaded_stripper') || &cp
  finish
endif
let g:loaded_stripper = 1

" Don't strip whitespace on these filetypes
if ! exists('g:StripperIgnoreFileTypes')
  let g:StripperIgnoreFileTypes = ['markdown', 'liquid']
endif

augroup stripper
  " Strip trailing whitespace before saving
  autocmd BufWritePre * Stripper
augroup END

" Strip trailing white space
function! Stripper#strip(line1, line2)
  if ! exists('g:noStripTrailingWhiteSpace') && index(g:StripperIgnoreFileTypes, &ft) < 0
    execute ':'. a:line1 .','. a:line2 . 's/\s\+$//e'
  endif
endfunction

command! -nargs=? -range=% Stripper :call Stripper#strip(<line1>, <line2>)
