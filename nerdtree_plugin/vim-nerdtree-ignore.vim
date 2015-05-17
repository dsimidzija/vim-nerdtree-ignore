augroup vim_nerdtree_ignore
  autocmd!
  autocmd User NERDTreeInit,NERDTreeNewRoot call <sid>refresh(b:NERDTreeRoot.path.str())
augroup END

if !exists('s:DefaultIgnore')
  let s:DefaultIgnore = g:NERDTreeIgnore
endif
let s:NERDTreeIgnoreFile = '.nerdtreeignore'

function! s:refresh(path) abort
  let l:path = nerdtreeignore#util#join([a:path, s:NERDTreeIgnoreFile])

  if !filereadable(l:path)
    if exists('g:IgnoreSetByNERDTreeIgnore')
      let g:NERDTreeIgnore = s:DefaultIgnore
      unlet g:IgnoreSetByNERDTreeIgnore
      call NERDTreeRender()
      "echoerr 'NERDTreeIgnore set to default: '.join(g:NERDTreeIgnore, ', ')
    endif
    return
  endif

  let l:expressions = readfile(l:path)
  let g:NERDTreeIgnore = l:expressions
  let g:IgnoreSetByNERDTreeIgnore = 1
  call NERDTreeRender()
  "echoerr 'NERDTreeIgnore set to: '.join(g:NERDTreeIgnore, ', ')
endfunction
