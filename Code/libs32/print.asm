[bits 32]                   ; Not sure but should allow for 32 bits registers: e prefix e.g. eax instead ax

VIDEO_MEMORY equ 0xb8000    ;Location where the Video Memory is usually located
WHITE_ON_BLACK equ 0x0f     ;0x0f is white on black background. For mpre options: https://os.phil-opp.com/vga-text-mode/

;prints a string to the top left of the Window in 32 bit Protected Mode; uses eax as parameter for string location
printStr32:
  pusha
  mov edx, VIDEO_MEMORY

  .loop:                  ; loops through every char of string
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK
    cmp al, 0
    je .return
    mov [edx], ax

    add ebx, 1          ; moves one char forward if it got printed
    add edx, 2          ; moves one char forward in the video memory location (2 because one char is 2 bytes)
    jmp .loop

.return:
  popa
  ret
