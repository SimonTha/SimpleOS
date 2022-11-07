char name[20];
int pos = 0;
int nameSet = 0;

void setup2(){
  int i;
  for(i = 0; i < 20; i++){
    name[i] = 0;
  }
  pos = 0;
  nameSet = 0;
  clearScreen();
  print("What is your name?", 0, 0);
  return;
}

void keyPressed2(unsigned int keyCode){
  if(keyCode < 36){
    if(nameSet == 0){
      printChar(keyCodeToChar(keyCode), pos, 1, 0x0f);
      name[pos] = keyCodeToChar(keyCode);
      pos++;
    }
  }else if(keyCode == 36){
    char msg[27] = "Hello: ";
    int i;
    for(i = 0; i < 20; i++){
      msg[7+i] = name[i];
    }
    print(msg, 0, 2);
    nameSet = 1;
  }else if(keyCode == 37){
    exit();
  }
}
