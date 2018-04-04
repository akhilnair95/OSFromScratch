; prints value of DX as hex
; dependencies - print_string

print_hex:

  mov cl, dl
  and cl, 0x0F
  mov bx, 5
  call put_char
 
  mov cl, dl
  and cl, 0xF0
  shr cl, 4
  mov bx, 4
  call put_char
  
  mov cl, dh
  and cl, 0x0F
  mov bx, 3
  call put_char
  
  mov cl, dh
  and cl, 0xF0
  shr cl, 4
  mov bx, 2
  call put_char
  
  mov bx, HEX_OUT
  call print_string

;puts ASCII of cl in itself
put_char:
  cmp cl, 9
  jg alpha
  
    add cl, 48
    jmp gc_end
  
  alpha:
    add cl, 55
  
  gc_end:
    add bx, HEX_OUT
    mov [bx], cl
  ret


HEX_OUT:
db '0x0000', 0
