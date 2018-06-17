;Global Descriptor Table

gdt_start:

gdt_null: 	; the mandatory null descriptor

dd 0x00 	; 4B
dd 0x00


gdt_code:	; Code Segment Descriptor

dw 0xffff	; Limit (0 -15)
dw 0x0		; Base	(16 - 31)
db 0x0		; Base  (0 - 7 Part2)

; Type flags 
; (Present) 1  (Ring) 00  (Descr Type) 1
; 1010 Code Conforming Readable Accessed
db 10011010b	

; Granularity 32fl 64fl AVL FF(Limit Part2)
db 11001111b

db 0x0 ; Base (24 - 31 P2)


gdt_data:

dw 0xffff
dw 0x0
db 0x0

; 1001 Same as code
; 0010 Code ExpDown Writable Acessed
db 10010010b

db 11001111b

db 0x0


gdt_end:


gdt_descriptor:

dw gdt_end - gdt_start - 1  ; size of gdt
dd gdt_start		    ; start address of GDT


;Some handy constants

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start	


