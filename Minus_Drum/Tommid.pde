//Reproduce los sonidos del Tom

class Tommid{
  
  Elipse area;
  AudioSample audio;
  
  Tommid(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/TOM-MID.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
