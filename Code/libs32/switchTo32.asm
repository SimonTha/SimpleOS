[bits 16]

switchTo32:
  cli                         ; ignore all interrupts
  lgdt [gdt_descriptor]       ; laod the global descriptor table

  mov eax, cr0                ; set the cr0 flag so the cpu changes to protected mode
  or eax, 0x1
  mov cr0, eax

  jmp CODE_SEG:init_pm        ; jump to a new sector --> flush the cpu pipeline because old 16 bit instructions may not work properly


[bits 32]

init_pm:
  mov ax, DATA_SEG            ; the segmentation method in the protected mode completely changed --> makes old segment registers useless and overwrite them with the new data segment
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  mov ebp, 0x90000
  mov esp, ebp                ; set 32 bit stack to this location

  call start32
