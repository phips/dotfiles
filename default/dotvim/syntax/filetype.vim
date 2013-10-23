"
" Barcap UnixEng - this file is under Subversion control:
" $Id: filetype.vim 2012 2008-02-11 17:06:40Z sa_dewha $
" $URL: svn://engsun05/bootstrap/dev/puppet/tools/dotvim/filetype.vim $
"
" detect puppet filetypes
" $Id: filetype.vim 2012 2008-02-11 17:06:40Z sa_dewha $

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.pp     setfiletype puppet
augroup END


" au BufRead,BufNewFile *.pp     setfiletype puppet
