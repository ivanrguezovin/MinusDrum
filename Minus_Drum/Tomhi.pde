//Reproduce los sonidos del Tom

class Tomhi{
  
  Elipse area;
  AudioSample audio;
  
  Tomhi(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/TOM-HI.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
