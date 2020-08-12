format ELF64

public gcd
public fibonacci
public factorial


;gcd(a, 0) = a
;gcd (a, b) = gcd(b, a mod b)
section ' gcd' executable 
; | input :
; rax = number 1
; rbx = number 2
; | output :
; rax = number
gcd:
	push rbx
	.next_iter:
		cmp rbx, 0
		je .close
		xor rdx, rdx
		div rbx
		push rbx
		mov rbx, rdx
		pop rax
		jmp .next_iter
	.close:
		pop rbx
		ret


;0 0 1 2 3 5 8 13 21...
section '.fibonacci' executable
; | input:
; rax = number 
; | output:
; rax = number
fibonacci:
	push rbx
	push rcx
	mov rbx, 0
	mov rcx, 1
	cmp rax, 0
	je .next_step
	.next_iter:
		cmp rax, 1
		jle .close
		push rcx
		add rcx, rbx
		pop rbx
		dec rax
		jmp .next_iter
	.next_step:
		xor rcx,rcx
	.close:
		mov rax, rcx
		pop rcx
		pop rbx
		ret

; 6| 1 * 2 * 3 * 4 * 5 * 6 = 720
section '.factorial' executable
; | input :
; rax = number
; | output
;  rax = number
factorial:
	push rbx
	mov rbx, rax
	mov rax,1
	.next_iter:
		cmp rbx,1
		jle .close
		mul rbx
		dec rbx
		jmp .next_iter
	.close:
	pop rbx
	ret 

