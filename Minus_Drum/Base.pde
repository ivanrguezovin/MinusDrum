//Reproduce los sonidos de la base

class Base{
  
  Elipse area;
  AudioSample audio;
  
  Base(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/BASE.mp3",1024);
  }
  
  boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
  void reproducirSonido(){
    audio.trigger();
  }
}
