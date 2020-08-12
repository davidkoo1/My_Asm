format ELF64
public print_number
public print_string
public print_char
public print_line

include "str.inc"

extrn length_string

section '.bss' writable 
	; _buffer rb _buffer.size
	bss_char rb 1


section '.print_number' executable
; | input:
; rax = number
print_number:
    push rax
    push rbx
    push rcx
    push rdx
    xor rcx, rcx
    .next_iter:
        mov rbx, 10
        xor rdx, rdx
        div rbx
        add rdx, '0'
        push rdx
        inc rcx
        cmp rax, 0
        je .print_iter
        jmp .next_iter
    .print_iter:
        cmp rcx, 0
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
; | input
; rax = char
print_char:
    push rdx
    push rcx
    push rbx
    push rax

    mov [bss_char], al

    mov rax, 4
    mov rbx, 1
    mov rcx, bss_char
    mov rdx, 1
    int 0x80

    pop rax
    pop rbx
    pop rcx
    pop rdx
    ret

section '.print_string' executable
; | input
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

section '.print_line' executable
print_line:
    push rax
    mov rax, 0xA
    call print_char
    pop rax
    ret