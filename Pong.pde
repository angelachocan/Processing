//variables paddle1
int paddleX1 = 40;
int paddleY1 = height/2;
int paddleW1 = 30;
int paddleH1 = 100;
int paddleV1 = 5;
int score1 = 0;
boolean up;
boolean down;


//variables paddle2
int paddleX2 = 960;
int paddleY2 = height/2;
int paddleW2 = 30;
int paddleH2 = 100;
int paddleV2 = 5;
int score2 = 0;
boolean up2;
boolean down2;


//variables pelota
int ballX ;
int ballY ;
int ballradio = 25;
int velballX = 4;
int velballY = 6;

void setup() {
  //pantalla
  size (1000, 700);
  textSize (30);
  ballX = width/2;
  ballY = height/2;
}

void draw () {

  dibujar();
  movepelota();
  movepaddle1();
  movepaddle2();
  limitepaddle1();
  limitepaddle2();
  contactopaddle1();
  contactopaddle2();
  scores ();
}

//DIBUJAR
void dibujar() {
  
  //pantalla
  background (0);
  //circulo suelo
  fill (0);
  stroke (250);
  ellipse (500, 350, 200, 200);
  //linea del medio
  fill (250);
  rectMode (CORNER);
  rect (width/2, 0, 10, 700);
 

  //pelota
  stroke (245, 239, 59);
  fill(245, 239, 59);
  ellipse(ballX, ballY, ballradio*2, ballradio*2);

  //paddle1
  stroke (250, 0, 0);
  fill (250, 0, 0);
  rectMode (CENTER);
  rect (paddleX1, paddleY1, paddleW1, paddleH1); 
  movepaddle1();
  contactopaddle1();
  limitepaddle1();

  //paddle2
  stroke (0, 250, 0);
  fill (0, 250, 0);
  rectMode (CENTER);
  rect (paddleX2, paddleY2, paddleW2, paddleH2);

}
 
  //MOVIMIENTOS 

 void movepelota () {
   //movimiento 
  ballX = ballX + velballX;
  ballY = ballY + velballY;
  //rebote
  if ( ballX > width - ballradio/2) {
    setup();
    velballX = -velballX ;
    score1 = score1 + 1;
  } else if ( ballX < 0 + ballradio/2) {
    setup();
    velballX = -velballX;
    score2 = score2 + 1;
  }
  if ( ballY > height- ballradio/2) {
    velballY = -velballY ;
  } else if ( ballY < 0 + ballradio/2) {
    velballY = -velballY ;
  }

 }

void movepaddle1() {
  if (up) {
    paddleY1 = paddleY1 - paddleV1;
  }

  if (down) {
    paddleY1 = paddleY1 + paddleV1;
  }
}

void movepaddle2() {
  if (up2) {
    paddleY2 = paddleY2 - paddleV2;
  }
  if (down2) {
    paddleY2 = paddleY2 + paddleV2;
  }
}

void limitepaddle1 () {
  if (paddleY1 - paddleH1/2 < 0) {
    paddleY1 = paddleY1 + paddleV1;
  }
  if (paddleY1 + paddleH1/2 > height) {
    paddleY1 = paddleY1 - paddleV1;
  }
}

void limitepaddle2() {
  if (paddleY2 - paddleH2/2 < 0) {
    paddleY2 = paddleY2 + paddleV2;
  }
  if (paddleY2 + paddleH2/2 > height) {
    paddleY2 = paddleY2 - paddleV2;
  }
}

//DETECCIÓN

//teclas
void keyPressed() {
  if (key == 'w' || key == 'W') {
    up = true;
  }
  if (key == 's' || key == 'S') {
    down = true;
  }
  if (key == '8') {
    up2 = true;
  }
  if (key == '2') {
    down2 = true;
  }
}

void keyReleased() {
  if (key == 'W' || key == 'w') {
    up = false;
  }
  if (key == 's' || key == 'S') {
    down = false;
  }
  if (key == '8') {
    up2 = false;
  }
  if (key == '2') {
    down2 = false;
  }
}

void contactopaddle1() {

  if (ballX - ballradio < paddleX1 + paddleW1/2 && ballX + ballradio/2 > paddleX1 - paddleW1/2) {
    if ( ballY - ballradio < paddleY1 + paddleH1/2 && ballY + ballradio/2 > paddleY1 - paddleH1/2) {
      velballX = -velballX;
    }
  }
}

void contactopaddle2() {

  if (ballX + ballradio > paddleX2 - paddleW2/2 && ballX - ballradio/2 < paddleX2 + paddleY2 ) {
    if (ballY + ballradio > paddleY2 - paddleH2/2 && ballY - ballradio/2 < paddleY2 + paddleH2/2 ) {
      velballX = -velballX;
    }
  }
}

void scores() {
  fill (250);
  text (score1, 100, 50);
  text (score2, 900, 50);
}
