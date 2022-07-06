;readDisk: This function reads the Disk via BIOS and stores it in memory
;Parameters: bx = where the read Data is going to be stored; dh = How many sectors are going to be read;

readDisk:
 push dx

 ;Set segment registers
 mov ah, 0x02
 mov al, dh
 mov ch, 0x00
 mov dh, 0x00
 mov cl, 0x02

 int 0x13         ;BIOS Interrupt for reading the DISK
 jc diskError     ;Error flag triggerd if BIOS isn't able to read the DISK

 pop dx
 cmp dh, al       ;Check if the correct sectors got read
 jne diskError
 ret

diskError:
  mov bx, errorMsg
  call printStr16
  jmp $

errorMsg:
  db "ERROR: Not able to read Disk", 0

BootDrive:
  db 0
