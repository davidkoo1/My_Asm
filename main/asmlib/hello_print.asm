
format ELF64
public _start
new_line equ 0xA

msg db "Hello, world!",new_line, 0 ;0xA - \n
len = $-msg
;len equ 13 ;13 - byte

_start:
	mov rax, msg
	call print_string ; Hello, world!
	;call print_string ; Hello, world!
	;call print_string ; Hello, world!
	;call print_string ; Hello, world!
;Типо void ()
	call exit

; | input:
; rax = string
print_string:
push rax
push rbx
push rcx
push rdx
mov rcx, rax
call length_string
mov rdx, rax
mov rax, 4
mov rbx, 1
int 0x80
pop rdx
pop rcx
pop rbx
pop rax
	ret
; | input:
;rax = string
; | output:
; rax = length
length_string:
push rdx
	xor rdx, rdx ; mov rdx, 0
	.next_iter:
		cmp [rax+rdx], byte 0
		je .close ;if
		inc rdx
		 jmp .next_iter ; jmp = go to (.C)
		.close:
		mov rax, rdx 
		pop rdx
	   ret



exit:
	mov rax, 1  ; 1 - exit
	mov rbx, 0  ; 0 - return
	int 0x80


	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
; format ELF64
; public _start
; new_line equ 0xa
; msg db "hello world!",new_line, 0
; ;len equ 13
; len = $-msg
; _start:
; mov rax, 4; 4 - write
; mov rbx, 1; 1 - stdout
; mov rcx, msg
; mov rdx, len
; int 0x80
; call exit

; exit:
; mov rax, 1 ;1 - exit
; mov rbx, 0 ; 0 - return
; int 0x80 


; /////////////////////////////////////// 632 byte
; format ELF64
; public _start
; new_line equ 0xa
; msg db "hello world!",new_line, 0
; ;len equ 13
; len = $-msg
; _start:
; ; mov rax, 4; 4 - write
; ; mov rbx, 1; 1 - stdout
; ; mov rcx, msg
; ; mov rdx, len
; ; int 0x80
; mov rax, msg
; call printf
; call exit


; ; |input :
; ; rax=string:
; printf:
; push rax
; push rbx
; push rcx
; push rdx
; mov rcx, rax
; call length_string
; mov rdx, rax
; mov rax, 4
; mov rbx,1
; int 0x80
; pop rdx
; pop rcx
; pop rbx
; pop rax
; 	ret

; ;| input:
; ;rax=string
; ;|output:
; ;rax=length
; length_string: 
; 	push rdx ; в стэг
; 	xor rdx, rdx;rdx, 0
; 	;for:
; 		.net_iter:
; 			cmp [rax+rdx], byte 0 ;break/continue;
; 			je .close
; 			inc rdx ;i++
; 			jmp .net_iter ;jmp = goto
; 			.close:
; 			mov rax, rdx
; 			pop rdx
; 	ret
; exit:
; mov rax, 1 ;1 - exit
; mov rbx, 0 ; 0 - return
; int 0x80 
; ////////////////////////////////////////// 223 byte
; format ELF64  executable ;<---

; entry _start ; точка входа


; ; public _start

; new_line equ 0xa
; msg db "hello world",new_line, 0
; ;len equ 13
; len = $-msg
; _start:
; ; mov rax, 4; 4 - write
; ; mov rbx, 1; 1 - stdout
; ; mov rcx, msg
; ; mov rdx, len
; ; int 0x80
; mov rax, msg
; call printf
; call exit


; ; |input :
; ; rax=string:
; printf:
; push rax
; push rbx
; push rcx
; push rdx
; mov rcx, rax
; call length_string
; mov rdx, rax
; mov rax, 4
; mov rbx,1
; int 0x80
; pop rdx
; pop rcx
; pop rbx
; pop rax
; 	ret

; ;| input:
; ;rax=string
; ;|output:
; ;rax=length
; length_string: 
; 	push rdx ; в стэг
; 	xor rdx, rdx;rdx, 0
; 	;for:
; 		.net_iter:
; 			cmp [rax+rdx], byte 0 ;break/continue;
; 			je .close
; 			inc rdx ;i++
; 			jmp .net_iter ;jmp = goto
; 			.close:
; 			mov rax, rdx
; 			pop rdx
; 	ret
; exit:
; mov rax, 1 ;1 - exit
; mov rbx, 0 ; 0 - return
; int 0x80 
; ////////// 180 byte
; format ELF64  executable ;<---

; entry _start ; точка входа


; ; public _start

; new_line equ 0xa
; msg db "hello world!",new_line, 0

; ;len equ 13
; len = $-msg
; _start:
; mov rax, 4
; mov rbx, 1
; mov rcx, msg
; mov rdx, len
; int 0x80
; mov rax, 1
; mov rbx, 0
; int 0x80
;/////////////////////////////////////////////////////////// 176 byte
; format ELF64  executable ;<---

; entry _start ; точка входа


; ; public _start

; new_line equ 0xa
; msg db "hello world!",new_line, 0

; ;len equ 13
; len = $-msg
; _start:
; mov rax, 4
; mov rbx, 1
; mov rcx, msg
; mov rdx, len
; int 0x80
; mov rax, 1
; xor rbx, rbx
; int 0x80
;//////////////////////////////////////// 175 byte
; format ELF64  executable ;<---

; entry _start ; точка входа


; ; public _start

; new_line equ 0xa
; msg db "hello world!",new_line, 0

; ;len equ 13
; len = $-msg
; _start:
; mov rax, 4
; mov rbx, 1
; mov rcx, msg
; mov rdx, len
; int 0x80
; xor rax, rax
; inc rax
; xor rbx, rbx
; int 0x80
;//////////////////////////////////////// 174 byte
; format ELF64  executable ;<---

; entry _start ; точка входа


; ; public _start

; new_line equ 0xa
; msg db "hello world!",new_line, 0

; ;len equ 13
; len = $-msg
; _start:
; mov rax, 4
; xor rbx, rbx
; inc rbx
; mov rcx, msg
; mov rdx, len
; int 0x80
; xor rax, rax
; inc rax
; xor rbx, rbx
; int 0x80
; ////////////////////////лучший выбор, потому что разделенно по секциям(section)/////////////////////////1160 byte
; format ELF64
; public _start


; section '.data' writable


; 	new_line equ 0xa
; 	msg db "hello world!",new_line, 0
; 	;len equ 13
; 	len = $-msg
; section '.text' executable
; _start:
; ; mov rax, 4; 4 - write
; ; mov rbx, 1; 1 - stdout
; ; mov rcx, msg
; ; mov rdx, len
; ; int 0x80
; mov rax, msg
; call printf
; call exit


; ; |input :
; ; rax=string:
; section '.printf' executable
; printf:
; push rax
; push rbx
; push rcx
; push rdx
; mov rcx, rax
; call length_string
; mov rdx, rax
; mov rax, 4
; mov rbx,1
; int 0x80
; pop rdx
; pop rcx
; pop rbx
; pop rax
; 	ret
; section '.length_string' executable
; ;| input:
; ;rax=string
; ;|output:
; ;rax=length
; length_string: 
; 	push rdx ; в стэг
; 	xor rdx, rdx;rdx, 0
; 	;for:
; 		.net_iter:
; 			cmp [rax+rdx], byte 0 ;break/continue;
; 			je .close
; 			inc rdx ;i++
; 			jmp .net_iter ;jmp = goto
; 			.close:
; 			mov rax, rdx
; 			pop rdx
; 	ret
; section '.exit' executable
; exit:
; mov rax, 1 ;1 - exit
; mov rbx, 0 ; 0 - return
; int 0x80 