[org 0x7c00]

mov ah, 0x0e

mov al, [secret]
int 10h

jmp $


secret:
db "X"

times 510 - ($-$$) db 0

dw 0xaa55
