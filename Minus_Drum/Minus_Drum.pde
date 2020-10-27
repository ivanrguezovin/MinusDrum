//Clase general, detecta las manos y manda reproducir sonidos

import ddf.minim.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencvMano;

static Minim minim;

PImage bateria;
PImage baqueta;

Base base;
Snare caja;
Charles charles;
Tomhi tomIzquierdo;
Tommid tomDerecho;
Ride platilloIzquierdo;
Crash platilloDerecho;

boolean raton = false;

void setup(){
   size(1280, 720);
   
   minim = new Minim(this);
   
   video = new Capture(this,width, height);
   frameRate(5);
   video.start();
   
   opencvMano = new OpenCV(this,width, height);
   opencvMano.loadCascade("hand.xml");
   
   bateria = loadImage("/img/bateria.jpeg");
   baqueta = loadImage("/img/baqueta.png");
   
   platilloIzquierdo = new Ride(new Elipse(new Punto(160,0),242.5,157.5));
   platilloDerecho = new Crash(new Elipse(new Punto(1280,50),340,240));
   tomIzquierdo = new Tomhi(new Elipse(new Punto(465,195),132.5,100));
   tomDerecho = new Tommid(new Elipse(new Punto(805,180),145,107.5));
   charles = new Charles(new Elipse(new Punto(125,300),200,100));
   caja = new Snare(new Elipse(new Punto(220,550),197.5,135));
   base = new Base(new Elipse(new Punto(1130,515),250,150));
   
   image(bateria,0,0);
}

void draw(){
  image(bateria,0,0);
 
  if (video.height>0 && video.width>0){
    opencvMano.loadImage(video);
    
    stroke(0);
    noFill();
    strokeWeight(3);
    
    Rectangle[] manos = opencvMano.detect();
    
    if(!raton){
      frameRate(5);
      video.start();
      image(video,480,510,width/4,height/4);
      
      for (int i = 0; i < min(2,manos.length); i++) {
        image(baqueta, manos[i].x, manos[i].y);
        
        Punto p = new Punto(manos[i].x+manos[i].width/2,manos[i].y+manos[i].height/2);
        
        if(base.isIn(p))
          base.reproducirSonido();
        else if(caja.isIn(p))
          caja.reproducirSonido();
        else if(charles.isIn(p))
          charles.reproducirSonido();
        else if(platilloIzquierdo.isIn(p))
          platilloIzquierdo.reproducirSonido();
        else if(platilloDerecho.isIn(p))
          platilloDerecho.reproducirSonido();
        else if(tomIzquierdo.isIn(p))
          tomIzquierdo.reproducirSonido();
        else if(tomDerecho.isIn(p))
          tomDerecho.reproducirSonido();
      }
    }else if(raton){
      video.stop();
      frameRate(5);
      image(baqueta, mouseX, mouseY);
    
      Punto p = new Punto(mouseX, mouseY);
      if(base.isIn(p))
        base.reproducirSonido();
      else if(caja.isIn(p))
        caja.reproducirSonido();
      else if(charles.isIn(p))
        charles.reproducirSonido();
      else if(platilloIzquierdo.isIn(p))
        platilloIzquierdo.reproducirSonido();
      else if(platilloDerecho.isIn(p))
        platilloDerecho.reproducirSonido();
      else if(tomIzquierdo.isIn(p))
        tomIzquierdo.reproducirSonido();
      else if(tomDerecho.isIn(p))
        tomDerecho.reproducirSonido();
    }
    
  }
}

void movieEvent(Movie movie) {
  movie.read();
}

void captureEvent(Capture c) {
  c.read();
}

public static Minim getMinim(){
  return minim;
}

void keyPressed(){
  if(key == 'r'){
    if(raton)
      this.raton = false;
    else
      this.raton = true;
  }
}
