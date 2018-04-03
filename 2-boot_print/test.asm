
mov ax, 0x0941
mov bl, 0x9
mov cx, 0x0010

int 10h

jmp $

;pad with 510 zero - size of prev code
times 510 - ($-$$) db 0
dw 0xaa55
