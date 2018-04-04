;load DH sectors from disk to ES:BX from drive dl
; dependencies - print_string

disk_load:
  push dx
  mov ah, 0x02 ; BIOS read sector
  mov al, dh   ; read dh sectors
  mov ch, 0    ; Cylnder 0 
  mov dh, 0    ; Head 0
  mov cl, 2    ; Read from sector 2
  
  int 0x13     

  jc disk_error1

  pop dx
  cmp dh, al     ; check if correct num sectors read 
  jne disk_error2
  ret

  disk_error1:
  mov bx, DISK_ERR_MSG1
  call print_string
  jmp $

  disk_error2:
  mov bx, DISK_ERR_MSG2
  call print_string
  jmp $

;Data
DISK_ERR_MSG1:
db "Disk Read Error1!", 0

DISK_ERR_MSG2:
db "Disk Read Error2!", 0

