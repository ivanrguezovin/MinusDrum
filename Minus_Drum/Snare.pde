//Reproduce los sonidos de la snare

class Snare{
  
  Elipse area;
  AudioSample audio;
  
  Snare(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/SNARE.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
