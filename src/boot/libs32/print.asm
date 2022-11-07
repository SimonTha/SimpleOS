[bits 32]
; printStr32 prints a String to the top left corner of the screen via the Memory-mapped VGA Textbuffer in 32-bit-Protected-Mode
; parameters: ebx = adress of the String to print

VIDEO_MEMORY equ 0xb8000    ;Location where the Video Memory is usually located

printStr32:
  pusha
  mov edx, VIDEO_MEMORY

  .loop:                  ; loops through every char of string
    mov al, [ebx]
    mov ah, 0x0f
    cmp al, 0
    je .return
    mov [edx], ax

    add ebx, 1          ; moves one char forward if it got printed
    add edx, 2          ; moves one char forward in the video memory location (2 because one char is 2 bytes)
    jmp .loop

.return:
  popa
  ret
