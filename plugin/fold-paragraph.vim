" A simple plugin to toggle fold a paragraph with better foldtext
"
" Example usage:
"   set foldtext=FoldedParagraphText()
"   nmap <Space> :call ToggleFoldParagraph<CR>

function! ToggleFoldParagraph()
    if foldclosed('.') > -1
        normal zo
    else
        normal zfip
    endif
endfunction

function! FoldedParagraphText()
    let line = getline(v:foldstart)
    let foldsize = v:foldend - v:foldstart + 1
    let sizestr = " " . foldsize . " lines "
    let width = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let linecount = line("$")
    let percentage = printf("[%.1f", (foldsize*1.0)/linecount*100) . "%]"
    let padding = repeat("-", width - strwidth(sizestr.line.percentage))
    return line . padding . sizestr . percentage
endf
