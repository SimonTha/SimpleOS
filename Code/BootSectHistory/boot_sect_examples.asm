[org 0x7c00]            ;Specifie address for orientation
kernelPos equ 0x1000

mov [BootDrive], dl     ;Save boot drive in BootDrive

mov bp, 0x9000
mov sp, bp              ;Sets the basepointer of the Stack

mov bx, RMMsg
call printStr16         ;Print it as String for fun :)

call switchTo32         ; Permanently switching to 32 Bit Protected Mode

jmp $


;Include "libraries" or more completed code
%include "libs16/print.asm"
%include "libs16/diskLoader.asm"
%include "libs32/gdt.asm"
%include "libs32/print.asm"
%include "libs32/switchTo32.asm"

[bits 32]

; entry point after 32 bit protected mode is loaded
start32:
  mov ebx, PMMsg
  call printStr32 ; Use our 32 - bit print routine.

  call kernelPos
  jmp $                 ;Loop forever

;Global Variables
RMMsg:
  db "We are now in REALMODE", 0

PMMsg:
  db "We are now in PROTECTED MODE", 0
KernelLoadingMsg:
  db "Kernel is loading", 0

times 510-($-$$) db 0     ; Fill the Bootsector with 0's
dw 0xaa55                 ;"Magic Number": End of Bootsector

; db "This message is outside the DISK",0
; times 256 dw 0xdada       ;Store data outside the Bootsector for testing and bootstrapping
; times 256 dw 0xface       ;**
