[bits 32] ; 32 bit protected mode

;prints null terminated char pointed to by EBX on screen

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
 pusha
 mov edx, VIDEO_MEMORY

 print_string_pm_loop:
  mov al, [ebx]
  mov ah, WHITE_ON_BLACK
  
  cmp al, 0
  je print_string_pm_done
 
  mov [edx], ax  ; store char+ attr in video mem 
  add ebx, 1 ; next char
  add edx, 2 ; next video posn

  jmp print_string_pm_loop

 print_string_pm_done:
  popa
  ret
