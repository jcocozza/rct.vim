" rct.vim - easily copy text from remote vim to local clipboard

let g:rct_register = get(g:, 'rct_register', 'q')
let s:rct_last_yank = ''

function! CheckRCT()
    if !executable('rct')
        echo "rct not found"
        return 0
    endif
    return 1
endfunction

function! ProcessText()
    let yanked_text = getreg(g:rct_register)
    " Prevent duplicate processing
    if yanked_text ==# s:rct_last_yank
        return
    endif
    let s:rct_last_yank = yanked_text
    " echo 'text: ' . yanked_text
    let cmd = 'rct "' . escape(yanked_text, '"') . '"'
    let result = system(cmd)
    echo result
endfunction

function! rct#Main()
    let l:exists = CheckRCT()
    if l:exists == 0
        return
    endif
    call ProcessText()
endfunction

autocmd TextYankPost * if v:event.regname == g:rct_register | call rct#Main() | endif
