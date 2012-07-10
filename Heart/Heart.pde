World world;

/**
 * Initializes graphic part
 */
void initGraph()
{
  size(640, 640, P3D);
  frameRate(60);
  ortho();
  //noLoop();
}

void setup()
{
  initGraph();
  world = new World();
  background(#FF8080);
}

void draw()
{
  WorldTransformer worldTransformer = world.GetWorldTransformer();
  worldTransformer.SetRotation(new PVector(worldTransformer.GetRotation().x,
      worldTransformer.GetRotation().y, worldTransformer.GetRotation().z + 0.01));
  
  //DiscoEffect discoEffect = world.GetDiscoEffect();
  //discoEffect.DrawToCanvas();
  
  world.Render();
  //println(frameRate);
}

void mouseDragged() 
{
  WorldTransformer worldTransformer = world.GetWorldTransformer();
  final float rotationRate = 0.005;
  float deltaMouse = (mouseX - pmouseX) + (pmouseY - mouseY);
  float deltaRotation = deltaMouse * rotationRate;
  PVector currentRotation = worldTransformer.GetRotation();
  PVector nextRotation = new PVector(currentRotation.x,
    currentRotation.y, currentRotation.z);
    
  switch (mouseButton)
  {
    case LEFT:
      nextRotation.x += deltaRotation;
      break;
    case RIGHT:
      nextRotation.y += deltaRotation;
      break;
    case CENTER:
      nextRotation.z += deltaRotation;
      break;
  }
  worldTransformer.SetRotation(nextRotation);
  
  redraw();
}

void keyPressed()
{
  ImplicitFunctionPlotter implicitFunctionPlotter = world.GetImplicitFunctionPlotter();
  
  if (key >= '1' && key <= '3')
  {
    final HashMap pairs = new HashMap();
    pairs.put('1', 0);
    pairs.put('2', 1);
    pairs.put('3', 2);
    final int value = ((Integer)pairs.get(key)).intValue();
    implicitFunctionPlotter.SetPlotType(value);
  }
  else if (key >= 'a' && key <= 'z')
  {
    final HashMap pairs = new HashMap();
    pairs.put('q', 0.05);
    pairs.put('w', 0.1);
    pairs.put('e', 0.125);
    pairs.put('r', 0.25);
    pairs.put('t', 0.5);
    pairs.put('y', 1.0);
    if (pairs.get(key) != null)
    {
      final float value = ((Float)pairs.get(key)).floatValue();
      implicitFunctionPlotter.SetDelta(new PVector(value, value, value));
    }
  }

  redraw();
}
