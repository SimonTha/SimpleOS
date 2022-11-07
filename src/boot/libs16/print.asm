[bits 16]
; printStr16 prints a String in hte 16-Bit-RealMode with the BIOS Interrupt 0x10
; parameters: bx = adress of the String to print

printStr16:
  pusha

  mov ah, 0x0e
  mov al, [bx]

  .loop:
    int 0x10
    add bx, 1
    mov al, [bx]
    cmp al, 0
    jne .loop

  popa
  ret
