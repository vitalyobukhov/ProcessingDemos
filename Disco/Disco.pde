PGraphics canvas;
DiscoEffect disco;

void setup()
{
  size(640, 640, P2D);
  frameRate(60);
  disco = new DiscoEffect();
  disco.SetTileCount(new PVector(16, 16));
  disco.SetBrightnessBase(new PVector(160, 200));
  disco.SetBrightnessOffset(new PVector(5, 30));
  canvas = disco.GetCanvas();
}

void draw()
{
  disco.DrawToCanvas();
  background(canvas);
  println(frameRate);
}
