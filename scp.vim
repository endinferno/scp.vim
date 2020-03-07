let g:scp_vim_ip = ""
let g:scp_vim_account = "root"
" not code yet
let g:scp_vim_password = ""
let g:scp_vim_remote_folder = ""

" No argument
command Scp :call s:scpFile()

function! s:scpFile()
	if g:scp_vim_ip == ""
		call s:echoErr("No IP Detected")
		return
	endif
	let s:fileFullName = expand('%:p')
	let s:scpCommand = "silent !scp " . s:fileFullName . " " . g:scp_vim_account . "@" . g:scp_vim_ip . ":" . g:scp_vim_remote_folder
	echo "Waiting..."
	let s:ret = execute(s:scpCommand)
	let s:idx = stridx(s:ret, "lost connection")
	if s:idx == -1
		call s:echoSuccess("SUCCESS")
	else
		call s:echoErr("FAIL")
	endif
endfunction

function! s:echoErr(msg)
	silent echohl None
	silent echo "[Scp] : "
	silent echohl ErrorMsg
	silent echon a:msg
	silent echohl None
endfunction

function! s:echoSuccess(msg)
	silent echohl None
	silent echo "[Scp] : "
	silent echohl SignColumn
	silent echon a:msg
	silent echohl None
endfunction
