[org 0x7c00]            ;Specifie address for orientation

mov [BootDrive], dl     ;Save boot drive in BootDrive

mov bp, 0x8000
mov sp, bp              ;Sets the basepointer of the Stack

mov bx, 0x9000
mov dh, 5
mov dl, [BootDrive]
call readDisk           ;Test code for showing disk reading

mov bx, [0x9000]
call printHex           ;Prove that disk got read and print it

mov bx, 0x9000
call printStr           ;Print it as String for fun :)


jmp $                   ;Loop forever

;Include "libraries" or more completed code
%include "libs/print.asm"
%include "libs/diskLoader.asm"

;Global Variables
testMsg:
  db "Hello World", 0

BootDrive:
  db 0

times 510-($-$$) db 0     ; Fill the Bootsector with 0's
dw 0xaa55                 ;"Magic Number": End of Bootsector

times 256 dw 0xdada       ;Store data outside the Bootsector for testing and bootstrapping
times 256 dw 0xface       ;**
