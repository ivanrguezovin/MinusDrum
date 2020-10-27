//Reproduce los sonidos del ride

class Ride{

  Elipse area;
  AudioSample audio;
  
  Ride(Elipse area){
    this.area = area;
    audio = Minus_Drum.getMinim().loadSample("/sonidos/RIDE.mp3",1024);
  }
  
   boolean isIn(Punto p){
     return EstaDentroDeElipse.isIn(this.area, p);
  }
  
   void reproducirSonido(){
    audio.trigger();
  }
}
