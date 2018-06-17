[bits 16]

switch_to_pm:

cli			; Disable interrupts till protected mode IVT is set up
lgdt [gdt_descriptor] 	; Load our gdt


; First bit of cr to 1 
; Welcome to 32b land !!!

mov eax, cr0
or eax, 0x1
mov cr0, eax 

; Far jump to 32 bit mode ( helps to flush the pipeline )

jmp CODE_SEG:init_pm

[bits 32]

;initialise registers and stack in pm

init_pm:

mov ax, DATA_SEG

mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

mov ebp, 0x90000 	; Set SP to top of free space
mov esp, ebp

call BEGIN_PM
