//Reproduce los sonidos del ride

class Crash{

  Elipse area;
  AudioSample audio;
  
  Crash(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/CRASH.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
