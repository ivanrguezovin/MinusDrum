//Reproduce los sonidos del Charles

class Charles{
  
  Elipse area;
  AudioSample audio;
  
  Charles(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/CHARLES.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
