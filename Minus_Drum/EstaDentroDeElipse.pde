class Punto{
  int x, y;
  
  Punto (int x, int y){
    this.x = x;
    this.y = y;
  }
}

class Elipse{
  double alto, ancho;
  Punto centro;
  
  Elipse(Punto centro, double ancho, double alto){
    this.centro = centro;
    this.alto = alto;
    this.ancho = ancho;
  }
}

static class EstaDentroDeElipse{
  
  static boolean isIn(Elipse elipse, Punto p){
     //xcentro = k, ycentro = h, ancho/2 = rx, alto/2 = ry;
    boolean dentro = false;
    
    int h = elipse.centro.x;
    int k = elipse.centro.y;
    int x = p.x;
    int y = p.y;

    double parte1 = Math.pow(x-h,2);
    double parte2 = Math.pow(elipse.ancho,2);
    
    double parte3 = Math.pow(y-k,2);
    double parte4 = Math.pow(elipse.alto,2);
    
    double division1 = parte1/parte2;
    double division2 = parte3/parte4;
    
    double resultado = division1 + division2;
    
    if(resultado <= 1)
      dentro = true;
    
    return dentro;
  }
 
}
