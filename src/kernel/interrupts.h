struct idt_desriptor
{
  uint16_t size;
  uintptr_t offset;
}__attribute__((packed));

struct idt_entry
{
  uint16_t    isr_low;      // The lower 16 bits of the ISR's address
	uint16_t    kernel_cs;    // The GDT segment selector that the CPU will load into CS before calling the ISR
	uint8_t     reserved;     // Set to zero
	uint8_t     attributes;   // Type and attributes; see the IDT page
	uint16_t    isr_high;     // The higher 16 bits of the ISR's address
}__attribute__((packed));

void interruptHandler();
void setupInterrupts();
void loadIdt();

#include "interrupts.c"
