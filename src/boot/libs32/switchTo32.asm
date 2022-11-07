[bits 16]

switchTo32:
  cli                         ; deactivate interrupts
  lgdt [gdt_descriptor]       ; laod the global descriptor table

  mov eax, cr0                ; set the cr0 flag so the cpu changes to protected mode
  or eax, 0x1
  mov cr0, eax

  jmp 0x8:setup_ProtectedMode        ; jump to a new sector --> flush the cpu pipeline because old 16 bit instructions may not work properly
                                          ;indirectly set CS to code segment

[bits 32]

setup_ProtectedMode:
  mov ax, 0x10            ; Set the Segment Registers to the Data Segment
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  mov ebp, 0x90000
  mov esp, ebp                ; set 32 bit stack to the beginning of the free space

  call start32
