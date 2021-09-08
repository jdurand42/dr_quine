%define DECLARATION global _main

%macro CODE 2
	_main:
		lea rdi, [rel %1]
		mov rsi, 0x202
		mov rax, 0x2000005
		syscall
		cmp rax, 0
		jl _bad_fd
		mov rdi, rax
		lea rsi, [rel %2]
		mov rdx, 10 ; 1
		mov rcx, 34 ; 2
		mov r8, 9 ; 3
		lea r9, [rel %2] ; 4
		add rsp, -16 ; Pushing 2 bytes to stack for alignment
		push 37
		xor rax, rax
		call _dprintf
		add rsp, 24 ; poping 2 dummy bytes + 37 char
		xor rax, rax ; return 0
		ret
%endmacro

; Vive les macros

section .text
	extern _dprintf
	extern _printf
	extern _open
	extern _exit
	DECLARATION
	CODE file_name, s

	_bad_fd:
		mov rdi, 1
		mov rax, 0x2000001
		syscall
		ret

section .data
	file_name:
		db "Grace_kid.s", 0
	s:
		db "%5$cdefine DECLARATION global _main%1$c%1$c%5$cmacro CODE 2%1$c%3$c_main:%1$c%3$c%3$clea rdi, [rel %5$c1]%1$c%3$c%3$cmov rsi, 0x202%1$c%3$c%3$cmov rax, 0x2000005%1$c%3$c%3$csyscall%1$c%3$c%3$ccmp rax, 0%1$c%3$c%3$cjl _bad_fd%1$c%3$c%3$cmov rdi, rax%1$c%3$c%3$clea rsi, [rel %5$c2]%1$c%3$c%3$cmov rdx, 10 ; 1%1$c%3$c%3$cmov rcx, 34 ; 2%1$c%3$c%3$cmov r8, 9 ; 3%1$c%3$c%3$clea r9, [rel %5$c2] ; 4%1$c%3$c%3$cadd rsp, -16 ; Pushing 2 bytes to stack for alignment%1$c%3$c%3$cpush 37%1$c%3$c%3$cxor rax, rax%1$c%3$c%3$ccall _dprintf%1$c%3$c%3$cadd rsp, 24 ; poping 2 dummy bytes + 37 char%1$c%3$c%3$cxor rax, rax ; return 0%1$c%3$c%3$cret%1$c%5$cendmacro%1$c%1$c; Vive les macros%1$c%1$csection .text%1$c%3$cextern _dprintf%1$c%3$cextern _printf%1$c%3$cextern _open%1$c%3$cextern _exit%1$c%3$cDECLARATION%1$c%3$cCODE file_name, s%1$c%1$c%3$c_bad_fd:%1$c%3$c%3$cmov rdi, 1%1$c%3$c%3$cmov rax, 0x2000001%1$c%3$c%3$csyscall%1$c%3$c%3$cret%1$c%1$csection .data%1$c%3$cfile_name:%1$c%3$c%3$cdb %2$cGrace_kid.s%2$c, 0%1$c%3$cs:%1$c%3$c%3$cdb %2$c%4$s%2$c, 0%1$c", 0
