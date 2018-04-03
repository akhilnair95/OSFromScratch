mov bp, 0x8000
mov sp, bp

mov al, 'H'
call print

mov al, 'E'
call print
; Infinite loop
jmp $


print:
mov ah, 0x0e
int 10h
ret

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55
