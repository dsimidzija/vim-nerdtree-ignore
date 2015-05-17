" All of this was copied from https://github.com/xolox/vim-misc
" so all credit goes to Peter Odding. This was done simply to not
" create a dependency to vim-misc for these few functions.

function! nerdtreeignore#util#is_win()
  " Returns 1 (true) when on Microsoft Windows, 0 (false) otherwise.
  return has('win16') || has('win32') || has('win64')
endfunction

function! nerdtreeignore#util#directory_separator()
  " Find the preferred directory separator for the platform and settings.
  return exists('+shellslash') && &shellslash ? '/' : '\'
endfunction

function! nerdtreeignore#util#join(parts)
  " Join a list of pathname components (the first and only argument) into a
  " single pathname string.
  if type(a:parts) == type([])
    if nerdtreeignore#util#is_win()
      return join(a:parts, nerdtreeignore#util#directory_separator())
    elseif get(a:parts, 0) == '/'
      " Absolute path on UNIX (non-Windows).
      return '/' . join(a:parts[1:], '/')
    else
      " Relative path on UNIX (non-Windows).
      return join(a:parts, '/')
    endif
  endif
  return ''
endfunction
