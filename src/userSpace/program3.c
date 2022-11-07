int x, y;
int direction;

void setup3(){
  direction = 0;
  x = 40;
  y = 12;
  clearScreen();
  draw();
}

void draw(){
  printChar(' ', x, y, 0x0f);
  switch(direction) {
    case 0: y++;break;
    case 1: y--;break;
    case 2: x--;break;
    case 3: x++;break;
  }
  printChar('#', x, y, 0x0f);
}

void keyPressed3(unsigned int keyCode){
  switch(keyCode) {
    case 18: direction = 0;draw();break;
    case 22: direction = 1;draw();break;
    case 0: direction = 2;draw();break;
    case 3: direction = 3;draw();break;
    case 37: exit();break;
  }
  return;
}
