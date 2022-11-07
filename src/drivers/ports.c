unsigned char inb( unsigned short port ) {
  char result;
  __asm__ ("in %%dx, %%al" : "=a" (result) : "d" (port));
  return result;
}

void outb(unsigned short port, unsigned char data){
  __asm__ ("out %%al, %%dx" : :"a" (data), "d" (port));
}
