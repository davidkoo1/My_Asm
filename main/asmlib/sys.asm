format ELF64
public exit 
section '.exit' executable
	exit:
		mov rax, 1 ;1 - exit
		mov rbx, 0 ; 0 - return
		int 0x80
