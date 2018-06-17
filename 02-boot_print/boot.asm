mov ah, 0x0e
mov al, 'H'
int 0x10
mov al,'e'
int 0x10
mov al,'l'
int 0x10
mov al,'l'
int 0x10
mov al,'o'
int 0x10

jmp $

;pad with 510 zero - size of prev code
times 510 - ($-$$) db 0
dw 0xaa55
