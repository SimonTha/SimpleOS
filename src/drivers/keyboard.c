__attribute__((weak)) void keyPressed(unsigned int keyCode);
__attribute__((weak)) void keyReleased(unsigned int keyCode);

int keys[38] = {0};
int keyList[] = {0xff, 37, 27, 28, 29, 30, 31, 32, 33, 34, 35, 26, 0xff, 0xff, 0xff, 0xff, 16,22,4,17,19,25,20,8,14,15, 0xff, 0xff, 36, 0xff, 0, 18,3,5,6,7,9,10,11, 0xff, 0xff, 0xff, 0xff, 0xff, 24,23, 2,21, 1, 13,12};
//a-z 0-9 Enter

void keyboardHandler() {
  __asm__("pushal");
    unsigned int scanCode = inb(0x60);
    if(keyList[scanCode] != 0xff){
      if(keys[keyList[scanCode]] == 0){
        keys[keyList[scanCode]] = 1;
      }
    }
    if(scanCode > 0&& scanCode < 89){
      if(keys[keyList[scanCode]] == 1){
        keyPressed(keyList[scanCode]);
        keys[keyList[scanCode]] = 2;
      }
    }else if(scanCode >= 128&&scanCode < 217){
      keyReleased(scanCode);
      keys[keyList[scanCode-0x80]] = 0;
    }
    PIC_sendEOI(2);
    __asm__("popal; leave; iret");
}
