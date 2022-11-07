#include "kernel.h"
#include "stdin.h"
#include "simpleOS.h"
#include "../drivers/screen.h"
#include "../drivers/ports.h"
#include "../drivers/pic.h"
#include "../drivers/keyboard.h"
#include "../userSpace/program1.h"
#include "../userSpace/program2.h"
#include "../userSpace/program3.h"
#include "GUI.h"
#include "interrupts.h"

void main () {    //ATTENTION: using main may cause trouble beacuse of GNU compilation
  cursor = 0;
  isProgRunning = 0;
  clearScreen();
  setupInterrupts();
  drawMainMenu();
  halt();
}


void keyPressed(unsigned int keyCode){
  if(isProgRunning==0){
    switch(keyCode) {
      case 18: if(cursor < 2){cursor++;}drawMainMenu();break;
      case 22: if(cursor > 0){cursor--;}drawMainMenu();break;
      case 36: runUserProgram(cursor);break;
    }
  }else{
    if(programmRunning == 0){
      keyPressed1(keyCode);
    }else if(programmRunning == 1){
      keyPressed2(keyCode);
    }else if(programmRunning == 2){
      keyPressed3(keyCode);
    }
  }
  return;
}

void keyReleased(unsigned int keyCode){
  return;
}

void runUserProgram(int program){
  isProgRunning = 1;
  programmRunning = program;
  if(programmRunning == 0){
    setup1();
  }else if(programmRunning == 1){
    setup2();
  }else if(programmRunning == 2){
    setup3();
  }
}
