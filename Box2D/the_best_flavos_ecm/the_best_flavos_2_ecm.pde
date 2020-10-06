import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Flavo flavo;
Flavo p1;

ArrayList<Particle> particles;
ArrayList<Boundary> boundaries;
ArrayList<Flavo> flavos;
//NOTE TO NATALIA
//i have to create one that is just standing there horizontally and one that starts at like 30 degrees and moves towards it and then collides and then boom,
//maybe ill have to create custom forces to simulate the springs (actually i will definitely have to do that) 
//also i have to create a circular boundary maybe?as a chain?idk
void setup() {
  size(400,400);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  boundaries = new ArrayList<Boundary>();
  flavos = new ArrayList<Flavo>();
  Flavo p1 = new Flavo(width/4,height/4,false);
  flavos.add(p1);
  boundaries.add(new Boundary(width/2,height-5,width,10,0));
  boundaries.add(new Boundary(width/2,5,width,10,0));
  boundaries.add(new Boundary(width-5,height/2,10,height,0));
  boundaries.add(new Boundary(5,height/2,10,height,0));

}

void draw() {
  background(255);
  for (Boundary wall: boundaries) {
    wall.display();
  }
  box2d.step();
  int i = 0;
  Vec2 previous = new Vec2(0,0);
  for (Flavo p: flavos) {
    if (i==0) { previous = new Vec2(p.node4.body.getWorldCenter().x,p.node4.body.getWorldCenter().y);  p.apply_vel(false); p.apply_force(); }
    if (i==1) {
      p.apply_vel(true);
      //p.apply_force();
      //p.apply_force(previous.x,previous.y);
      p.straighten();  
  }
    p.display();
    i = i+1;
    
  }
  
  
  fill(0);
}


void mousePressed() {
  Flavo p = new Flavo(mouseX,mouseY,true);
  flavos.add(p);
}
