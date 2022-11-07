void interruptHandler() {
    __asm__("pushal");
    print("Interrupt Occured!", 0, 24);
    __asm__("popal; leave; iret");
}

void loadIdt(){
  static struct idt_entry idt[256];
  int i;
  for(i = 0; i < 256; i++){
    struct idt_entry newEntry;
    void* isrPointer = &interruptHandler;
    newEntry.attributes = 0x8f;

    if(i == 24){
      isrPointer = &keyboardHandler;
      newEntry.attributes = 0x8e;
    }

    newEntry.isr_low = (uint32_t) isrPointer & 0xFFFF;
    newEntry.kernel_cs = 0x0008;
    newEntry.reserved = 0x00;
    newEntry.isr_high = (uint32_t) isrPointer >> 16;

    idt[i] = newEntry;
  }

  struct idt_desriptor idtr;
  idtr.size = 0xff;
  idtr.offset = (uintptr_t) &idt;

  __asm__ volatile("lidt %0" :: "m"(idtr));
  return;
}

void setupInterrupts(){
  loadIdt();
  PIC_remap(0x18, 0x20);
  __asm__("sti");             //enable Hardware interrupts
}
