[org 0x7c00]

;BIOS stores boot drive num in dl
MOV [BOOT_DRIVE], dl

; stack at 0x8000
mov bp, 0x8000
mov sp, bp

mov bx, 0x9000 ; mov data to es:bx
mov dh, 5      ; load 5 sectors
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]
call print_hex

mov dx, [0x9000 + 512]
call print_hex

jmp $ ; Infinite loop

%include "print_hex.asm"
%include "print_string.asm"
%include "disk_load.asm"

;Data
BOOT_DRIVE:
db 0

; fill with 510 zeroes - size of previous code
times 510-($-$$) db 0
; Magic number 
dw 0xaa55

;Fill up next 5 sectors
times 256 dw 0xdada
times 256 dw 0xface
times 512 db 0
times 512 db 0
times 512 db 0 
