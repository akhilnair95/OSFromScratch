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
