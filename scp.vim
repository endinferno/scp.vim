let g:scp_vim_ip = ""
let g:scp_vim_account = "root"
" not test now
let g:scp_vim_password = ""
let g:scp_vim_remote_folder = ""

" No argument
command Scp :call s:scpFile()

function! s:scpFile()
	if g:scp_vim_ip == ""
		echo "No IP Detected"
	endif
	let s:fileFullName = expand('%:p')
	let s:scpCommand = "scp " . s:fileFullName . " " . g:scp_vim_account . "@" . g:scp_vim_ip . ":~"
	call system(s:scpCommand)
	echo "File scp finished"
endfunction
