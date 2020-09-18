class Flavo {
  
  RevoluteJoint joint1;
  RevoluteJoint joint2;
  RevoluteJoint joint3;
  RevoluteJoint joint4;
  RevoluteJoint joint5;
  RevoluteJoint joint6;
  RevoluteJoint joint7;
  RevoluteJoint joint8;
  RevoluteJoint joint9;
  RevoluteJoint joint10;
  RevoluteJoint joint11;
  RevoluteJoint joint12;
  DistanceJoint dj1;
  DistanceJoint dj2;
  DistanceJoint dj3;
  DistanceJoint dj4;
  DistanceJoint dj5;
  Body body;
  Box box1;
  Box box2;
  Box box3;
  Box box4;
  Box box5;
  Box box6;
  Particle node1;
  Particle node2;
  Particle node3;
  Particle node4;
  Particle node5;
  Particle node6;
  Particle node7;
  float w;
  float h;
  float r;
  float a2,a3,a4,a5,a6;
  float vel;
  float force;
  Vec2 center;
  boolean mode;
  
  Flavo(float x, float y,boolean mode) {
    w = 1;
    r = 1;
    h = 15;
    
    // Initialize positions of two boxes
    if (mode == true){
      node1 = new Particle(x,y,r,5);
      node2 = new Particle(x,y-h,r,5);
      node3 = new Particle(x,y-2*h,r,5);
      node4 = new Particle(x,y-3*h,r,5);
      node5 = new Particle(x,y-4*h,r,5);
      node6 = new Particle(x,y-5*h,r,5);
      node7 = new Particle(x,y-6*h,r,5);
      box1 = new Box(x, y-h/2, w, h,5); 
      box2 = new Box(x, y-1.5*h, w, h,5);
      box3 = new Box(x, y-2.5*h, w, h,5); 
      box4 = new Box(x, y-3.5*h, w, h,5); 
      box5 = new Box(x, y-4.5*h, w, h,5); 
      box6 = new Box(x, y-5.5*h, w, h,5);
    }
    else {
      node1 = new Particle(x,y,r,10);
      node2 = new Particle(x+h,y,r,10);
      node3 = new Particle(x+2*h,y,r,10);
      node4 = new Particle(x+3*h,y,r,10);
      node5 = new Particle(x+4*h,y,r,10);
      node6 = new Particle(x+5*h,y,r,10);
      node7 = new Particle(x+6*h,y,r,10);
      box1 = new Box(x+h/2, y, h, w,10); 
      box2 = new Box(x+1.5*h, y, h, w,10);
      box3 = new Box(x+2.5*h, y, h, w,10); 
      box4 = new Box(x+3.5*h, y, h, w,10); 
      box5 = new Box(x+4.5*h, y, h, w,10); 
      box6 = new Box(x+5.5*h, y, h, w,10);
    }

    // Define joint as between two bodies
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(node1.body, box1.body, node1.body.getWorldCenter());
    rjd1.enableLimit = true;
    rjd1.lowerAngle = -PI/8;
    rjd1.upperAngle = PI/8;
    // Create the joint
    joint1 = (RevoluteJoint) box2d.world.createJoint(rjd1);
    
    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(box1.body, node2.body, node2.body.getWorldCenter());
    rjd2.enableLimit = true;
    rjd2.lowerAngle = -PI/8;
    rjd2.upperAngle = PI/8;    
    // Create the joint
    joint2 = (RevoluteJoint) box2d.world.createJoint(rjd2);
    
    RevoluteJointDef rjd3 = new RevoluteJointDef();
    rjd3.initialize(node2.body, box2.body, node2.body.getWorldCenter());
    rjd3.enableLimit = true;
    rjd3.lowerAngle = -PI/8;
    rjd3.upperAngle = PI/8;
    // Create the joint
    joint3 = (RevoluteJoint) box2d.world.createJoint(rjd3);
    
    RevoluteJointDef rjd4 = new RevoluteJointDef();
    rjd4.initialize(box2.body, node3.body, node3.body.getWorldCenter());
    rjd4.enableLimit = true;
    rjd4.lowerAngle = -PI/8;
    rjd4.upperAngle = PI/8;
    // Create the joint
    joint4 = (RevoluteJoint) box2d.world.createJoint(rjd4);
    
    RevoluteJointDef rjd5 = new RevoluteJointDef();
    rjd5.initialize(node3.body, box3.body, node3.body.getWorldCenter());
    rjd5.enableLimit = true;
    rjd5.lowerAngle = -PI/8;
    rjd5.upperAngle = PI/8;
    // Create the joint
    joint5 = (RevoluteJoint) box2d.world.createJoint(rjd5);
    
    RevoluteJointDef rjd6 = new RevoluteJointDef();
    rjd6.initialize(box3.body, node4.body, node4.body.getWorldCenter());
    rjd6.enableLimit = true;
    rjd6.lowerAngle = -PI/8;
    rjd6.upperAngle = PI/8;
    // Create the joint
    joint6 = (RevoluteJoint) box2d.world.createJoint(rjd6);
    
    RevoluteJointDef rjd7 = new RevoluteJointDef();
    rjd7.initialize(node4.body, box4.body, node4.body.getWorldCenter());
    rjd7.enableLimit = true;
    rjd7.lowerAngle = -PI/8;
    rjd7.upperAngle = PI/8;
    // Create the joint
    joint7 = (RevoluteJoint) box2d.world.createJoint(rjd7);
    
    RevoluteJointDef rjd8 = new RevoluteJointDef();
    rjd8.initialize(box4.body, node5.body, node5.body.getWorldCenter());
    rjd8.enableLimit = true;
    rjd8.lowerAngle = -PI/8;
    rjd8.upperAngle = PI/8;
    // Create the joint
    joint8 = (RevoluteJoint) box2d.world.createJoint(rjd8);
    
    RevoluteJointDef rjd9 = new RevoluteJointDef();
    rjd9.initialize(node5.body, box5.body, node5.body.getWorldCenter());
    rjd9.enableLimit = true;
    rjd9.lowerAngle = -PI/8;
    rjd9.upperAngle = PI/8;
    // Create the joint
    joint9 = (RevoluteJoint) box2d.world.createJoint(rjd9);
    
    RevoluteJointDef rjd10 = new RevoluteJointDef();
    rjd10.initialize(box5.body, node6.body, node6.body.getWorldCenter());
    rjd10.enableLimit = true;
    rjd10.lowerAngle = -PI/8;
    rjd10.upperAngle = PI/8;
    // Create the joint
    joint10 = (RevoluteJoint) box2d.world.createJoint(rjd10);
    
    RevoluteJointDef rjd11 = new RevoluteJointDef();
    rjd11.initialize(node6.body, box6.body, node6.body.getWorldCenter());
    rjd11.enableLimit = true;
    rjd11.lowerAngle = -PI/8;
    rjd11.upperAngle = PI/8;
    // Create the joint
    joint11 = (RevoluteJoint) box2d.world.createJoint(rjd11);
    
    RevoluteJointDef rjd12 = new RevoluteJointDef();
    rjd12.initialize(box6.body, node7.body, node7.body.getWorldCenter());
    rjd12.enableLimit = true;
    rjd12.lowerAngle = -PI/8;
    rjd12.upperAngle = PI/8;
    // Create the joint
    joint12 = (RevoluteJoint) box2d.world.createJoint(rjd12);
    
    DistanceJointDef dist13= new DistanceJointDef();
    dist13.bodyA = node1.body;
    dist13.bodyB = node3.body;
    dist13.length = box2d.scalarPixelsToWorld(2*h);
    dist13.frequencyHz = 1;
    dist13.dampingRatio = 1.0;
    DistanceJoint dj1 = (DistanceJoint) box2d.world.createJoint(dist13);
    
    DistanceJointDef dist24= new DistanceJointDef();
    dist24.bodyA = node2.body;
    dist24.bodyB = node4.body;
    dist24.length = box2d.scalarPixelsToWorld(2*h);
    dist24.frequencyHz = 1;
    dist24.dampingRatio = 1.0;
    DistanceJoint dj2 = (DistanceJoint) box2d.world.createJoint(dist24);
    
    DistanceJointDef dist35= new DistanceJointDef();
    dist35.bodyA = node3.body;
    dist35.bodyB = node5.body;
    dist35.length = box2d.scalarPixelsToWorld(2*h);
    dist35.frequencyHz = 1;
    dist35.dampingRatio = 1.0;
    DistanceJoint dj3 = (DistanceJoint) box2d.world.createJoint(dist35);
    
    DistanceJointDef dist46 = new DistanceJointDef();
    dist46.bodyA = node4.body;
    dist46.bodyB = node6.body;
    dist46.length = box2d.scalarPixelsToWorld(2*h);
    dist46.frequencyHz = 1;
    dist46.dampingRatio = 1.0;
    DistanceJoint dj4 = (DistanceJoint) box2d.world.createJoint(dist46);
    
    DistanceJointDef dist57= new DistanceJointDef();
    dist57.bodyA = node5.body;
    dist57.bodyB = node7.body;
    dist57.length = box2d.scalarPixelsToWorld(2*h);
    dist57.frequencyHz = 1;
    dist57.dampingRatio = 1.0;
    DistanceJoint dj5 = (DistanceJoint) box2d.world.createJoint(dist57);
     
     
}

  void apply_vel(boolean flag){
     if (flag == true) {
       a2 = node2.body.getAngle() + PI/2;
       a3 = node3.body.getAngle() + PI/2;
       a4 = node4.body.getAngle() + PI/2;
       a5 = node5.body.getAngle() + PI/2;
       a6 = node6.body.getAngle() + PI/2;  
   }
     else{
       a2 = node2.body.getAngle();
       a3 = node3.body.getAngle();
       a4 = node4.body.getAngle();
       a5 = node5.body.getAngle();
       a6 = node6.body.getAngle(); 
     }
     vel = 1;
     Vec2 vel2 = new Vec2(vel*cos(a2),vel*sin(a2));
     node2.body.setLinearVelocity(vel2);
     Vec2 vel3 = new Vec2(vel*cos(a3),vel*sin(a3));
     node3.body.setLinearVelocity(vel3);
     Vec2 vel4 = new Vec2(vel*cos(a4),vel*sin(a4));
     node4.body.setLinearVelocity(vel4);
     Vec2 vel5 = new Vec2(vel*cos(a5),vel*sin(a5));
     node5.body.setLinearVelocity(vel5);
     Vec2 vel6 = new Vec2(vel*cos(a6),vel*sin(a6));
     node6.body.setLinearVelocity(vel6);
  }

  void apply_force(float point_x,float point_y){
    float coeff = 3;
    Vec2 force1 = new Vec2(coeff*(point_x - node1.body.getWorldCenter().x),coeff*(point_y - node1.body.getWorldCenter().y));
    Vec2 force2 = new Vec2(coeff*(point_x - node2.body.getWorldCenter().x),coeff*(point_y - node2.body.getWorldCenter().y));
    Vec2 force3 = new Vec2(coeff*(point_x - node3.body.getWorldCenter().x),coeff*(point_y - node3.body.getWorldCenter().y));
    Vec2 force4 = new Vec2(coeff*(point_x - node4.body.getWorldCenter().x),coeff*(point_y - node4.body.getWorldCenter().y));
    Vec2 force5 = new Vec2(coeff*(point_x - node5.body.getWorldCenter().x),coeff*(point_y - node5.body.getWorldCenter().y));
    Vec2 force6 = new Vec2(coeff*(point_x - node6.body.getWorldCenter().x),coeff*(point_y - node6.body.getWorldCenter().y));
    Vec2 force7 = new Vec2(coeff*(point_x - node7.body.getWorldCenter().x),coeff*(point_y - node7.body.getWorldCenter().y));
    node4.body.applyForceToCenter(force4);
    node5.body.applyForceToCenter(force5);
    node6.body.applyForceToCenter(force6);
 }
  void display() {
    box2.display();
    box1.display();
    box3.display();
    box4.display();
    box5.display();
    box6.display();
    node2.display();
    node1.display();
    node3.display();
    node4.display();
    node5.display();
    node6.display();
    node7.display();
    /*Vec2 pos1 = box2d.getBodyPixelCoord(node1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(node2.body);
    Vec2 pos3 = box2d.getBodyPixelCoord(node3.body);
    Vec2 pos4 = box2d.getBodyPixelCoord(node4.body);
    Vec2 pos5 = box2d.getBodyPixelCoord(node5.body);
    Vec2 pos6 = box2d.getBodyPixelCoord(node6.body);
    Vec2 pos7 = box2d.getBodyPixelCoord(node7.body);
    stroke(0);
    strokeWeight(2);
    line(pos1.x,pos1.y,pos3.x,pos3.y);
    stroke(0);
    strokeWeight(2);
    line(pos2.x,pos2.y,pos4.x,pos4.y);
    stroke(0);
    strokeWeight(2);
    line(pos3.x,pos3.y,pos5.x,pos5.y);
    stroke(0);
    strokeWeight(2);
    line(pos4.x,pos4.y,pos6.x,pos6.y);
    stroke(0);
    strokeWeight(2);
    line(pos5.x,pos5.y,pos7.x,pos7.y);*/
  }}
