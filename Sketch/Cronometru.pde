
void drawTimer(){
    second = (millis()/1000 ) - startTime;
    if(second % 60 == 0){
        min = second / 60;
    }
    int offset = 270;
    text("Timer : ", 400 + offset, gameMenuSize / 2 + 6);
    text(second %60 ,450 + offset, gameMenuSize / 2 + 6);
    text(":", 475 + offset, gameMenuSize / 2 + 6);
    text(min, 500 + offset, gameMenuSize / 2 + 6);
}
