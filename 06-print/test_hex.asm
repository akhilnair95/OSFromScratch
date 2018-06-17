[org 0x7c00]

mov dx, 0xA23B
call print_hex

; Infinite loop
jmp $

%include "print_hex.asm"
%include "print_string.asm"

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
