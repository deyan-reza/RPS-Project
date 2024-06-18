public class RPSchar{
int stock;
int health;
int shield_health;
int shield_stock;
int colr;
PVector pos;
Boolean jump = false;
Boolean shAct = false;
Boolean left = false;
Boolean right = false;

  public RPSchar(int cl, PVector spawn) {
    stock = 3;
    health = 100;
    shield_stock = 5;
    shield_health = 50;
    colr = cl;
    pos = spawn;
  }
  
  public RPSchar() {
    stock = 3;
    health = 100;
    shield_stock = 5;
    shield_health = 50;
    colr = 0;
    pos = new PVector(0,0);
  }
}
