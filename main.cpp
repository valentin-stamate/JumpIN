#include <iostream>
#include <graphics.h>
#include <winbgim.h>

void setup();
void draw();

int main()
{

  initwindow(800,600);

  setup();
  while(TRUE){
    draw();
    
    delay(30);
    cleardevice();
  }

  getch();
  closegraph();
  return 0;
}

void setup(){

}

void draw(){
  for (int r = 25; r <= 125; r += 20)
    circle(getmaxx() / 2, getmaxy() / 2, r);
}
