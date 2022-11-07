[bits 16]

;readDisk: This function reads the Disk via BIOS and stores it in memory
;Parameters: bx = where the read Data is going to be stored; dh = How many sectors are going to be read;

readDisk:
 pusha

 ;Set segment registers
 mov ah, 0x02
 mov al, dh
 mov ch, 0x00
 mov dh, 0x00
 mov cl, 0x02

 int 0x13         ;BIOS Interrupt for reading the DISK

 popa
 ret

BootDrive:        ;Place where the value of the boot drive gets stored
  db 0
