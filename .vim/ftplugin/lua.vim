function! SetLovePrefs()
    let dir = ~/Documents/GitHub/dotfiles/.vim/love.dict
    if has("win32") || has("win64")
        exe 'setlocal dictionary-=' . dir . ' dictionary+=~' . dir
        setlocal dictionary-=~/vimfiles/lua.dict dictionary+=~/vimfiles/lua.dict
        setlocal iskeyword+=.
    end
endfunction
if has("autocmd")
  augroup prog
    au!
    autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType lua call SetLovePrefs()
  augroup END
end
if has("win32") || has("win64")
  command! -nargs=* Love  :silent !"C:\Program Files (x86)\LOVE\love.exe" . <args>
  nmap <F11> = :Lua<CR>
  nmap <F12> = :Love<CR>
end
