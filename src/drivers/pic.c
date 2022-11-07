void PIC_sendEOI(unsigned char irq)
{
	if(irq >= 8){
		outb(PIC2_COMMAND, PIC_EOI);
	}
	outb(PIC1_COMMAND, PIC_EOI);
}

void PIC_remap(int offset1, int offset2){
	
	unsigned char maskRegisterMaster, maskRegisterSlave;

	maskRegisterMaster = inb(PIC1_DATA);                        // save masks
	maskRegisterSlave = inb(PIC2_DATA);

	outb(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4);  // starts the initialization sequence (in cascade mode)
	outb(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);
	outb(PIC1_DATA, offset1);                 // ICW2: Master PIC vector offset
	outb(PIC2_DATA, offset2);                 // ICW2: Slave PIC vector offset
	outb(PIC1_DATA, 4);                       // ICW3: tell Master PIC that there is a slave PIC at IRQ2 (0000 0100)
	outb(PIC2_DATA, 2);                       // ICW3: tell Slave PIC its cascade identity (0000 0010)

	outb(PIC1_DATA, ICW4_8086);
	outb(PIC2_DATA, ICW4_8086);

	outb(PIC1_DATA, maskRegisterMaster);   // restore saved masks.
	outb(PIC2_DATA, maskRegisterSlave);

	outb(PIC1_DATA, 0x0);//mask the keyboard interrupt
  outb(PIC2_DATA, 0x0);
}
