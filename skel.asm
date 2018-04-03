[org 0x7c00]

; Infinite loop
jmp $

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
