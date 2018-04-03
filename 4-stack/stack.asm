
mov ah, 0x0e
mov bp, 8000h

mov sp, bp

push 'A0'
push 'B1'
push 'C2'

pop bx
mov al, bh
int 10h

mov al, [0x7ffa]
int 10h

; Infinite loop
jmp $


; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
