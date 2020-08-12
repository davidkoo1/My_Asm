format ELF64
public _start

section '.bss' writable 
	bss_char rb 1
; section '.data' writable
; fmt  db "%c + %d = %d", 0
section '.text' executable
_start:

mov rax, 10
	; mov rax, 10
	; mov rax, 'h'
	; call print_char
	; mov rax, 'i'
	; call print_char
	; mov rax, '!'
	; call print_char
	; call print_line

; 	///
; mov rax, 100
; mov rbx, 25
			;add rax,rbx ; +
			;sub rax,rbx ; -
			;imul rax,rbx ; * на два поля (а,b)
			;mul rbx ; *
			;div rbx ; /
			;add rax, 10
call print_number
mov rax, '*'
call print_char
mov rax, 725
call print_number
mov rax, '='
call print_char
mov rax, 10
mov rbx, 725
mul rbx
call print_number
call print_line
	call exit

;rax | rdx
;
; 571 / 10 = 57 | 1 + '0'
; 57 / 10 = 5| 7
; 5 / 10 = 0 | 5
;

; '0' + 1 =  21 + 1 = 22 = '1'

section '.print_number' executable
; | input :
; rax = number
print_number:
	push rax
	push rbx
	push rcx
	push rdx
	xor rcx, rcx
	.next_iter: ; цикл (for)
	cmp rax, 0; cmp сравнения (if)
	je .print_iter ;je = прыгнуть на эту метку если значения равны
	mov rbx, 10
	xor rdx, rdx
	div rbx
	add rdx, '0'
	push rdx
	inc rcx
	jmp .next_iter
	.print_iter:
	cmp rcx,0
	je .close
	pop rax
	call print_char
	dec rcx
	jmp .print_iter
		.close:
pop rdx
pop rcx
pop rbx
pop rax
	ret



section '.print_char' executable
; | input:
; rax=char
print_char:
push rax
push rbx
push rcx
push rdx
	mov [bss_char], al


	;rax = 32 eax = 16|ax = ah|al
	; al-8 bit

	mov rax, 4
	mov rbx, 1
	mov rcx, bss_char
	mov rdx,1
	int 0x80


; //////
; 	push rax

; 	mov rax, 1 ; write
; 	mov rdi, 1 ; stdout
; 	mov rsi, rsp ; 
; 	mov rdx,1
; 	syscall

; 	pop rax
pop rdx
pop rcx
pop rbx
pop rax

	ret


section '.print_line' executable
print_line:
	push rax
mov rax, 0xa
call print_char

	pop rax
	ret

section '.exit' executable
exit:
	mov rax, 1 ;1 - exit
	mov rbx, 0 ; 0 - return
	int 0x80
