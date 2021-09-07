global _main
extern _printf

; un commentaire hors du main

section .text
_main:
; un commentaire dans le main
	push rbx
	lea rdi, [rel s]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [rel s]
	mov r8, 9
	call _printf
	call _f
	pop rbx
	ret

_f:
	ret

s:
	db "global _main%1$cextern _printf%1$c%1$c; un commentaire hors du main%1$c%1$csection .text%1$c_main:%1$c; un commentaire dans le main%1$c%4$cpush rbx%1$c%4$clea rdi, [rel s]%1$c%4$cmov rsi, 10%1$c%4$cmov rdx, 34%1$c%4$clea rcx, [rel s]%1$c%4$cmov r8, 9%1$c%4$ccall _printf%1$c%4$ccall _f%1$c%4$cpop rbx%1$c%4$cret%1$c%1$c_f:%1$c%4$cret%1$c%1$cs:%1$c%4$cdb %2$c%3$s%2$c, 0%1$c", 0
