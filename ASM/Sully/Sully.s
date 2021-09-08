
%macro PRINT_IN_STRING_1 3
	push rbx
	lea rdi, [rel %1]
	lea rsi, [rel %2]
	mov rdx, %3
	call _sprintf
	pop rbx
%endmacro

%macro PRINT_IN_STRING_2 4
	push rbx
	lea rdi, [rel %1]
	lea rsi, [rel %2]
	lea rdx, [rel %3]
	lea rcx, [rel %4]
	call _sprintf
	pop rbx
%endmacro

section .text
	extern _dprintf
	extern _sprintf
	extern _printf
	extern _system
	global _main

	_main:
		xor r10, r10
		mov r10, 5
		sub r10, 1
		PRINT_IN_STRING_1 path_b, path, r10
		PRINT_IN_STRING_1 name_b, name, r10
		PRINT_IN_STRING_1 exe_b, exe, r10
		PRINT_IN_STRING_2 compile_b, compile, path_b, name_b
		xor rax, rax
		call _open_file
		cmp rax, 0
		jl _bad_fd

		push rbx
		mov rdi, rax
		mov r10, rax
		lea rsi, [rel s]
		xor rdx, rdx
		mov rdx, 5
		sub rdx, 1
		call _write_in_file
		lea rdi, [rel compile_b]
		call _system
		mov rsi, 5
		sub rsi, 1
		cmp rsi, 0
		jg _exec_file
		mov rdi, r10
		call _close_file
		pop rbx

		xor rax, rax
		ret

	_write_in_file:
		add rsp, -8
		lea rcx, [rel s]
		mov r8, 10
		mov r9, 34
		push 37
		push 9
		call _dprintf
		add rsp, 24
		ret

	_exec_file:
		lea rdi, [rel exe_b]
		call _system
		pop rbx
		ret

	_open_file:
		lea rdi, [rel path_b]
		mov rsi, 0x202
		mov rax, 0x2000005
		syscall
		ret

	_bad_fd:
		mov rdi, 1
		mov rax, 0x2000001
		syscall
		ret

	_print_strings_for_test:
		push rbx
		lea rdi, [rel path_b]
		call _printf
		lea rdi, [rel name_b]
		call _printf
		lea rdi, [rel exe_b]
		call _printf
		lea rdi, [rel compile_b]
		call _printf
		pop rbx
		ret

	_close_file:
		mov rax, 0x2000006
		syscall
		ret

section .data
	s:
		db "%3$c%6$cmacro PRINT_IN_STRING_1 3%3$c%5$cpush rbx%3$c%5$clea rdi, [rel %6$c1]%3$c%5$clea rsi, [rel %6$c2]%3$c%5$cmov rdx, %6$c3%3$c%5$ccall _sprintf%3$c%5$cpop rbx%3$c%6$cendmacro%3$c%3$c%6$cmacro PRINT_IN_STRING_2 4%3$c%5$cpush rbx%3$c%5$clea rdi, [rel %6$c1]%3$c%5$clea rsi, [rel %6$c2]%3$c%5$clea rdx, [rel %6$c3]%3$c%5$clea rcx, [rel %6$c4]%3$c%5$ccall _sprintf%3$c%5$cpop rbx%3$c%6$cendmacro%3$c%3$csection .text%3$c%5$cextern _dprintf%3$c%5$cextern _sprintf%3$c%5$cextern _printf%3$c%5$cextern _system%3$c%5$cglobal _main%3$c%3$c%5$c_main:%3$c%5$c%5$cxor r10, r10%3$c%5$c%5$cmov r10, %1$d%3$c%5$c%5$csub r10, 1%3$c%5$c%5$cPRINT_IN_STRING_1 path_b, path, r10%3$c%5$c%5$cPRINT_IN_STRING_1 name_b, name, r10%3$c%5$c%5$cPRINT_IN_STRING_1 exe_b, exe, r10%3$c%5$c%5$cPRINT_IN_STRING_2 compile_b, compile, path_b, name_b%3$c%5$c%5$cxor rax, rax%3$c%5$c%5$ccall _open_file%3$c%5$c%5$ccmp rax, 0%3$c%5$c%5$cjl _bad_fd%3$c%3$c%5$c%5$cpush rbx%3$c%5$c%5$cmov rdi, rax%3$c%5$c%5$cmov r10, rax%3$c%5$c%5$clea rsi, [rel s]%3$c%5$c%5$cxor rdx, rdx%3$c%5$c%5$cmov rdx, %1$d%3$c%5$c%5$csub rdx, 1%3$c%5$c%5$ccall _write_in_file%3$c%5$c%5$clea rdi, [rel compile_b]%3$c%5$c%5$ccall _system%3$c%5$c%5$cmov rsi, %1$d%3$c%5$c%5$csub rsi, 1%3$c%5$c%5$ccmp rsi, 0%3$c%5$c%5$cjg _exec_file%3$c%5$c%5$cmov rdi, r10%3$c%5$c%5$ccall _close_file%3$c%5$c%5$cpop rbx%3$c%3$c%5$c%5$cxor rax, rax%3$c%5$c%5$cret%3$c%3$c%5$c_write_in_file:%3$c%5$c%5$cadd rsp, -8%3$c%5$c%5$clea rcx, [rel s]%3$c%5$c%5$cmov r8, 10%3$c%5$c%5$cmov r9, 34%3$c%5$c%5$cpush 37%3$c%5$c%5$cpush 9%3$c%5$c%5$ccall _dprintf%3$c%5$c%5$cadd rsp, 24%3$c%5$c%5$cret%3$c%3$c%5$c_exec_file:%3$c%5$c%5$clea rdi, [rel exe_b]%3$c%5$c%5$ccall _system%3$c%5$c%5$cpop rbx%3$c%5$c%5$cret%3$c%3$c%5$c_open_file:%3$c%5$c%5$clea rdi, [rel path_b]%3$c%5$c%5$cmov rsi, 0x202%3$c%5$c%5$cmov rax, 0x2000005%3$c%5$c%5$csyscall%3$c%5$c%5$cret%3$c%3$c%5$c_bad_fd:%3$c%5$c%5$cmov rdi, 1%3$c%5$c%5$cmov rax, 0x2000001%3$c%5$c%5$csyscall%3$c%5$c%5$cret%3$c%3$c%5$c_print_strings_for_test:%3$c%5$c%5$cpush rbx%3$c%5$c%5$clea rdi, [rel path_b]%3$c%5$c%5$ccall _printf%3$c%5$c%5$clea rdi, [rel name_b]%3$c%5$c%5$ccall _printf%3$c%5$c%5$clea rdi, [rel exe_b]%3$c%5$c%5$ccall _printf%3$c%5$c%5$clea rdi, [rel compile_b]%3$c%5$c%5$ccall _printf%3$c%5$c%5$cpop rbx%3$c%5$c%5$cret%3$c%3$c%5$c_close_file:%3$c%5$c%5$cmov rax, 0x2000006%3$c%5$c%5$csyscall%3$c%5$c%5$cret%3$c%3$csection .data%3$c%5$cs:%3$c%5$c%5$cdb %4$c%2$s%4$c, 0%3$c%5$cpath:%3$c%5$c%5$cdb %4$cSully_%6$cd.s%4$c, 0%3$c%5$cname:%3$c%5$c%5$cdb %4$cSully_%6$cd%4$c, 0%3$c%5$cexe:%3$c%5$c%5$cdb %4$c./Sully_%6$cd%4$c, 0%3$c%5$ccompile:%3$c%5$c%5$cdb %4$cchmod 777 %6$c1$s && nasm -f macho64 %6$c1$s && gcc -o %6$c2$s %6$c2$s.o && rm %6$c2$s.o%4$c, 0%3$c%5$ctest_fd:%3$c%5$c%5$cdb %4$c%6$cd%4$c, 0%3$c%3$csection .bss%3$c%5$cpath_b:%3$c%5$c%5$cresb 64%3$c%5$cname_b:%3$c%5$c%5$cresb 64%3$c%5$cexe_b:%3$c%5$c%5$cresb 64%3$c%5$ccompile_b:%3$c%5$c%5$cresb 126%3$c%3$c", 0
	path:
		db "Sully_%d.s", 0
	name:
		db "Sully_%d", 0
	exe:
		db "./Sully_%d", 0
	compile:
		db "chmod 777 %1$s && nasm -f macho64 %1$s && gcc -o %2$s %2$s.o && rm %2$s.o", 0
	test_fd:
		db "%d", 0

section .bss
	path_b:
		resb 64
	name_b:
		resb 64
	exe_b:
		resb 64
	compile_b:
		resb 126
