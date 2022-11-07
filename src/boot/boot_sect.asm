[org 0x7c00]            ; Specifie address for orientation
kernelPos equ 0x1000
mov [BootDrive], dl     ; Save boot drive in BootDrive

mov bp, 0x9000
mov sp, bp              ; Sets the basepointer of the Stack

mov bx, RMMsg
call printStr16         ; Print it as String for fun :)
mov al, "b"
mov ah, 0x0e
int 0x10
call loadKernel

call switchTo32         ; Permanently switching to 32 Bit Protected Mode

jmp $

[bits 32]

; entry point after 32 bit protected mode is loaded and setup
start32:
  mov ebx, PMMsg
  call printStr32

  call kernelPos        ; Jump to the loaded Segments, the kernel Entry
  jmp $

;Include "libraries" or more completed code
[bits 16]

%include "libs16/print.asm"
%include "libs16/diskLoader.asm"
%include "libs32/gdt.asm"
%include "libs32/print.asm"
%include "libs32/switchTo32.asm"
%include "libs16/loadKernel.asm"


;Data/Strings
RMMsg:
  db "We are now in REALMODE", 0

PMMsg:
  db "We are now in PROTECTED MODE", 0


times 510-($-$$) db 0     ; Fill the Bootsector with 0's
dw 0xaa55                 ;"Magic Number": End of Bootsector
