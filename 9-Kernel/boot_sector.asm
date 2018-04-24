[org 0x7c00]
KERNEL_OFFSET equ 0x1000 ; use the same offset used while linking the kernel

 mov [BOOT_DRIVE], dl ; BIOS sets the boot derive num in dl on boot

 mov bp, 0x9000
 mov sp, bp

 mov bx, MSG_REAL_MODE
 call print_string
 call print_nl

 call load_kernel ; Read the kernel from the disk
 
 call switch_to_pm ; Enter 32Bit mode, jump to 'BEGIN_PM'
 
 jmp $ ; Never Reach Here

%include "../8-32Bit/print_string.asm"
%include "../7-disk/disk_load.asm"
%include "../8-32Bit/gdt.asm"
%include "../8-32Bit/print_string_pm.asm"
%include "../8-32Bit/switch.asm"

[bits 16]

load_kernel:
  mov bx, MSG_LOAD_KERNEL
  call print_string
  call print_nl

  mov bx, KERNEL_OFFSET ; Read from disk to 0x1000
  mov dh, 2
  mov dl, [BOOT_DRIVE]
  call disk_load
  
  ret

[bits 32]

BEGIN_PM:

  mov ebx, MSG_PROT_MODE
  call print_string_pm

  call KERNEL_OFFSET ; Give control to kernel
  jmp $ ; hang if kernel returns control ( if ever)


; Global Variables

BOOT_DRIVE db 0
MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Succesfully Landed in 32 Bit mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0

; Bootsector padding
times 510 - ($ - $$) db 0
dw 0xaa55
