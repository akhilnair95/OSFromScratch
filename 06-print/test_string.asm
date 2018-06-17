[org 0x7c00]

mov bx, HELLO_MSG
call print_string

mov bx, GB_MSG
call print_string

; Infinite loop
jmp $

%include "print_string.asm"

;data
HELLO_MSG:
db 'Hello World! ',0

GB_MSG:
db 'Good Bye! ',0

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
