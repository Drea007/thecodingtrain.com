// Crearemos un COHETE blanco en forma de triángulo sin colorear:
class Rocket {
  PVector pos = new PVector(width/2, height - 15);
  /* Distancia principal de los vértices al punto central del
  triángulo-cohete: */
  int d = 12;
  color c = 255;
  
  // CONSTRUCTOR() -- EMPTY:
  Rocket() {}
  
  /* Método -- Detectar si hay una colisión del cohete con algu-
  no de los asteroides: */
  boolean collision() {
    
    for(Asteroid a: asteroids) {
      if(dist(a.pos.x, a.pos.y, rocket1.pos.x, rocket1.pos.y) < a.w + d) {
        return true;
      }
    } return false;
  }
  
  // Método -- Actualizar posición del cohete:
   void update(int y) {
    pos.y += y;
  }
  
  // Método -- Dibujar el cohete:
  void render() {
    // Con Borde pero sin Relleno:
    strokeWeight(2);
    stroke(c);
    noFill();
    triangle(pos.x - d, pos.y, pos.x + d, pos.y, pos.x, pos.y - (d*2+2));
  }
  
  // Método -- Reinicializar el recorrido del cohete:
  void reset() {
    pos = new PVector(width/2, height - 15);
  }
}
