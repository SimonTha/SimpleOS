[bits 16]
loadKernel:
  pusha
  mov bx, KernelLoadingMsg
  call printStr16

  mov bx, kernelPos       ; bx is the location where read disk gets stored  | IMPORTANT: change location because it could intervent with video memory
  mov dh, 25              ; dh is the number how many sectors should get read | 1 sector is 512 bytes
  mov dl, [BootDrive]     ; dl is which disk it should read
  call readDisk           ; Test code for showing disk reading

  popa
  ret

KernelLoadingMsg:
  db "Kernel is loading", 0
