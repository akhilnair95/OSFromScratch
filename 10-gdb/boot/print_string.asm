;prints String at address BX
print_string:
  mov ah, 0x0e

  beg:

   mov cl, [bx]
   cmp cl, 0
   je end

   mov al, cl
   int 10h

   add bx, 1
   jmp beg

  end:
  ret

print_nl:
  mov ah, 0x0e
  mov al, 0x0a ; \n
  int 0x10
  mov al, 0x0d ; \r
  int 0x10

  ret
