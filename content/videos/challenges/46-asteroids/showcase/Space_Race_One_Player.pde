// Declaración de la instancia del objeto "cohete":
Rocket rocket1;

// Variable para determinar el nº máximo de asteroides a crear:
int numAsteroids = 0;
// Array -- asteroides:
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

// Variable -- puntos:
int points = 0;
// Variable -- "it's or not gameOver":
boolean gameOver = false;

// --------------------Variables TEXTO------------------------//
// Variable tipo Fuente -- texto: "Game Over":
PFont gameOverT;

// Variables "timing" para crear asteroides en cada frame:
int startT_1 = 0;
int interval_1 = 160;

int endT = 0;

// Variables "timing" para reiniciar el juego:
int startT_2 = 0;
int interval_2 = 1700;

void setup() {
  size(650, 650);
  // Creamos la instancia del objeto "cohete":
  rocket1 = new Rocket();
  
  gameOverT = createFont("Cambria", 87);
  // Inicializamos el temporizador a partir de aquí:
  startT_1 = millis();
}

void draw() {
  background(0);
  
  if(rocket1.collision()) {
    /* Indicamos, a través de la variable declarada para ello, que
   la partida ha finalizado: */
    
    if(startT_2 == 0) {
      startT_2 = millis();
    }
    
    gameOver = true;
    
    if(gameOver) {
    // Escribimos en pantalla "Game Over":
    fill(231, 5, 85);
    textFont(gameOverT);
    textAlign(CENTER);
    text("Game Over!", width/2, height/2);
    }
    
    if(endT - startT_2 >= interval_2) {
      restartGame();
    }
  }
  
  /* Establecemos el período de tiempo que tiene que transcurrir para
  crear un nuevo objeto "asteroide": */
  if(endT - startT_1 >= interval_1 && numAsteroids <= 27) {
    // Creamos el objeto "asteroide":
    asteroids.add(new Asteroid());
    
    // Sumamos 1 al contador del nº de asteroides creado:
    numAsteroids++;
    // Reinicializamos el temporizador:
    startT_1 = millis();
  }
  
  // Hacemos que se dibuje el cohete:
  rocket1.render();
  
  // Recorremos el array con todos los cohetes:
  for(Asteroid a: asteroids) {
    
    if(!gameOver) {
      // Actualizamos la posición del elemento-asteroide actual:
      a.update();
    }
    // Lo mostramos:
    a.render();
  }
  
  if(rocket1.pos.y <= 0) {
    gainPoints();
    rocket1.reset();
  }
  
  
  // Paramos el temporizador justo cuando finaliza el draw():
  endT = millis();
  
  fill(255);
  textAlign(LEFT);
  textSize(86);
  text(points, 20, 86);
}

// Función predefinida -- detectar cuando se presiona una tecla:
void keyPressed() {
  
  if(!gameOver) {
    if(keyCode == UP) rocket1.update(-10);
    else rocket1.update(10);
  }
}

//---------FUNCIONES PROPIAS:-----------//

// Función -- Subir PUNTOS:
void gainPoints() {
  points++;
}

// Función -- REINICIAR el juego:
void restartGame() {
  /* Reinicializamos el cotador de PUNTOS y el del nº de asteroi-
  des creados: */
  points = 0;
  numAsteroids = 0;
  
  // Indicamos que ha pasado la etapa de "game over":
  gameOver = false;
  // Por tanto, reinicializamos el "timer" para la etapa de "game over":
  startT_2 = 0;
  
  /* Reseteamos el array de asteroides y volvemos a posicionar el
  cohete en el punto de partida/salida: */
  asteroids.clear();
  rocket1.reset();
}
