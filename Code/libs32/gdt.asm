gdt_start:                      ; used for calculating the size of the GDT

gdt_null:
  dd 0x0
  dd 0x0                        ; Important null descriptor / Similiar to the magic boot sector number just for safety

gdt_code :
  dw 0xffff                     ; Limit
  dw 0x0                        ; Base
  db 0x0                        ; Base
  db 10011010b                  ; first flag
  db 11001111b                  ; second flag
  db 0x0                        ; base

gdt_data:
  dw 0xffff                     ; Limit
  dw 0x0                        ; Base
  db 0x0                        ; Base
  db 10010010b                  ; first flag
  db 11001111b                  ; second flag
  db 0x0                        ; base

gdt_end:                      ; used for calculating the size of the GDT

gdt_descriptor:               ; The GDT descriptor gets loaded in and tells the size and location of the GDT
  dw gdt_end - gdt_start - 1  ; Size of the gdt

  dd gdt_start                ; starting point of the gdt
; the GDT consists of 2 segments: code and data segment
CODE_SEG equ gdt_code - gdt_start ; size of the Code segment
DATA_SEG equ gdt_data - gdt_start ; size of the Data segment
