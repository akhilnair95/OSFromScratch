; Infinite loop
loop:
jmp loop

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
loop2:
dw 0xaa55
