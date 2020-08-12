format ELF64
public _start

include "fmt.inc"
include "mth.inc"
include "sys.inc"



section '.text' executable
	_start:
		mov rax, 800
		mov rbx, 24
		call gcd
		call print_number
		call print_line
		call exit




