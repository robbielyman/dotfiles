let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_manual = 1
let g:vimtex_imaps_disabled = ['0']
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : ':',
            \ 'rhs' : '\colon',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : '~',
            \ 'rhs' : '\tilde',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : '-',
            \ 'rhs' : '\bar',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : '0',
            \ 'rhs' : '\varnothing',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : '#',
            \ 'rhs' : '\sharp',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : 's',
            \ 'rhs' : 'vimtex#imaps#style_math("mathscr")',
            \ 'expr' : 1,
            \ 'leader' : '#',
            \})
call vimtex#imaps#add_map(
            \{
            \ 'lhs' : 'F',
            \ 'rhs' : 'vimtex#imaps#style_math("mathsf")',
            \ 'expr' : 1,
            \ 'leader' : '#',
            \})
