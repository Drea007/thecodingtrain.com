// Crearemos objetos "asteroide" en forma de rectángulos de color gris:
class Asteroid {
  
  // Posición inicial o punto de partida del asteroide:
  PVector pos = new PVector(0, random(50, height - 66));
  /* Los asteroides solo se moverán en sentido HORIZONTAL; mientras que
  el cohete, lo hará VERTICAL: */
  float velx;
  /* Variable -- sentido o lado del sketch por dónde aparecerá el aste-
  roide; es deicr, por el lado IZQUIERDO o DERECHO: */
  boolean side;
  
  // Tamaño del asteroide:
  int w = 12;
  int h = 4;
  
  // Color:
  color c = 220;
  
  Asteroid() {
  
  /* Establecemos una probabilidad del 50/50 de que el lado por dónde a-
  parezca el asteroide sea el IZQUIERDO o el DERECHO: */
  side = boolean(Math.round(random(1)));
  
  /* Si el lado que salga el es DERECHO, el asteroide tendrá que avanzar
  en sentido POSITIVO, es decir, la velocidad será POSITIVA porque el as-
  teroide debe posición mayor cada vez: */
  if(side) {
    pos.x = -12;
    velx = 2.4;
  }
  
  /* En caso, contrario, por tanto, la velocidad será NEGATIVA porque el
  asteroide debe ir bajando de posición en el eje de abscisas(X): */
  else {
    pos.x = width + 12;
    velx = -2.4;
  }
  }
  
  // Método -- Actualizar la posición del asteroide:
  void update() {
    pos.x +=  velx;
    
    if(velx > 0) {
      if(pos.x >= width + w) reset();
    } else {
      if(pos.x <= -w) reset();
    }
  }
  
  // Método -- Dibujar rel asteroide:
  void render() {
    strokeCap(ROUND);
    noStroke();
    fill(c);
    rect(pos.x, pos.y, w, h);
  }
  
  /* Método -- Reinicializar el recorrido del asteroi-
  de: */
  void reset() {
    pos = new PVector(0, random(50, height - 66));
    
    side = boolean(Math.round(random(1)));
    
    if(side) {
      pos.x = -12;
      velx = 2.4;
    }
    else {
      pos.x = width + 12;
      velx = -2.4;
    }  
  }
}
