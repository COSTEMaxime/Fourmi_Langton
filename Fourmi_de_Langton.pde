final int TAILLE = 75;

int[][] tableau = new int[TAILLE][TAILLE];

int x = TAILLE/2;
int y = TAILLE/2;
int sens = 0;
int n = 0;

int ratio;

boolean pause = false;

PImage menu;

void setup()  {
  
 size(900,900);
 frameRate(1000);
 fill(255);
 
 ratio = width / TAILLE;
 
 if (ratio * TAILLE != width)  {
   
  println("Choisissez une autre taille");
  exit();
 }
 
 for (int i = 0; i < TAILLE; i++)  {
  for (int j = 0; j < TAILLE; j++)  {
    
    rect(i*ratio,j*ratio,ratio,ratio);
  }
 }
 
 menu = loadImage("menu.png");
 menu.resize(160,45);
 image(menu,0,0);
  
}

void draw()  {
  
  if (!pause)  {
    fourmi();
  }
}


void fourmi()  {

  //0 = haut 1 = droite 2 = bas 3 = gauche 
  if (x < 0 || y < 0 || x > TAILLE - 1 || y > TAILLE - 1)  {
   noLoop();
  }else {
    
  if (tableau[x][y] == 0)  {
     
     tableau[x][y] = 1;
     sens++;
     fill(0);
    
  }else {
    
    tableau[x][y] = 0;
    sens--;
    fill(255);
    
  }
  
  rect(x*ratio,y*ratio,ratio,ratio);
  
    if (sens == 4)  {sens = 0;}
    if (sens == -1)  {sens = 3;}
     
     switch (sens)  {
       
      case 0:
        y--;
        break;
        
      case 1:
        x++;
        break;
        
      case 2:
        y++;
        break;
        
      case 3:
        x--;
        break;    
     }
     
    fill(255,0,0);
    rect(x*ratio,y*ratio,ratio,ratio);
  }
  
  n++;
  surface.setTitle("" + n);
}

void mousePressed()  {
  
 if (mouseY <= 45)  {
  if (mouseX <= 40)  {pause = true;}
  else if (mouseX <= 80)  {exit();}
  else if (mouseX <= 120)  {pause = false;}
  else if (mouseX <= 160 && pause)  {fourmi();}
 }
}

void keyPressed()  {
  
 if (key == 'p' || key == 'P')  {
   
  pause = !pause;
  }
}