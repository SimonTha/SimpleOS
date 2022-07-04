mov ah, 0x0e
mov al, "E"
int 0x10
mov al, "r"
int 0x10
mov al, "i"
int 0x10
mov al, "c"
int 0x10
mov al, " "
int 0x10
mov al, "s"
int 0x10
mov al, "t"
int 0x10
mov al, "i"
int 0x10
mov al, "n"
int 0x10
mov al, "k"
int 0x10
mov al, "t"
int 0x10
jmp $

times 510-($-$$) db 0
dw 0xaa55