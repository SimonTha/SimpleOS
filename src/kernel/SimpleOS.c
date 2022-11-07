
int strlen(char* ptr){
  int i = 0;
  while(ptr[i] != 0x00){
    i++;
  }
  return i;
}

void halt(){
  __asm__("hlt");
}

char keyCodeToChar(unsigned int keyCode){
  char* list = "abcdefghijklmnopqrstuvwxyz0123456789";
  return list[keyCode];
}

void exit(){
  main();
}
