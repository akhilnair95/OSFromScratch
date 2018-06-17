[org 0x7c00]

mov al, 'H'
mov bx, ret1
jmp print
ret1:

mov al, 'E'
mov bx, ret2
jmp print
ret2:

; Infinite loop
jmp $


print:
mov ah, 0x0e
int 10h
jmp bx

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
