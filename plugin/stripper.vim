if exists('g:loaded_stripper') || &cp
  finish
endif
let g:loaded_stripper = 1

augroup stripper
  " Strip trailing whitespace before saving
  autocmd BufWritePre * call s:stripTrailingWhiteSpace()
augroup END

" Strip trailing white space
function! s:stripTrailingWhiteSpace()
  if ! exists('g:noStripTrailingWhiteSpace')
    " Markdown uses trailing whitespace, so don't do it if we're editing markdown
    if &ft !~# '^\%(markdown\|liquid\)$'
      :%s/\s\+$//e
    endif
  endif
endfunction

" TODO: make a vim function for this that takes a range
"function! StripWhiteSpace()
"  call s:stripTrailingWhiteSpace()
"endfunction
