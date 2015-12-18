" A simple plugin to toggle fold a paragraph with better foldtext
"
" Example usage:
"   set foldmethod=manual
"   nmap <Space> :call ToggleFoldParagraph<CR>

function! ToggleFoldParagraph()
    try
        normal za
    catch
        normal zfip
    endtry
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

silent! set foldtext=FoldedParagraphText()
