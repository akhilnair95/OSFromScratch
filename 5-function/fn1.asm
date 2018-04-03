
mov al, 'H'
jmp print
ret:

; Infinite loop
jmp $


print:
mov ah, 0x0e
int 10h
jmp ret

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
