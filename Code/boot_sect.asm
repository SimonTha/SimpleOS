[org 0x7c00]            ;Specifie address for orientation

mov bp, 0x9000
mov sp, bp              ;Sets the basepointer of the Stack

mov bx, RMMsg
call printStr16         ;Print it as String for fun :)

mov [BootDrive], dl     ;Save boot drive in BootDrive
mov bx, 0x8000          ; bx is the location where read disk gets stored  | IMPORTANT: change location because it could intervent with video memory
mov dh, 5               ; dh is the number how many sectors should get read | 1 sector is 512 bytes
mov dl, [BootDrive]     ; dl is which disk it should read
call readDisk           ;Test code for showing disk reading

mov bx, 0x8000
call printStr16         ;Prove that disk got read and print it

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

  jmp $                 ;Loop forever

;Global Variables
RMMsg:
  db "We are now in REALMODE", 0

PMMsg:
  db "We are now in PROTECTED MODE", 0


times 510-($-$$) db 0     ; Fill the Bootsector with 0's
dw 0xaa55                 ;"Magic Number": End of Bootsector

db "This message is outside the DISK",0
; times 256 dw 0xdada       ;Store data outside the Bootsector for testing and bootstrapping
; times 256 dw 0xface       ;**
