PlasmaEffect plasma;

void setup()
{
  size(480, 480, P3D);
  frameRate(60);
  
  plasma = new PlasmaEffect();
  plasma.SetResolutionX(32);
  plasma.SetResolutionY(32);
  
  PlasmaEffectEmitter emitter1 = new PlasmaEffectEmitter();
  emitter1.SetFrequency(new PVector(PI / 4.0, PI / 7.0, PI / 11.0));
  emitter1.SetCenterX(32);
  emitter1.SetCenterY(32);

  PlasmaEffectEmitter emitter2 = new PlasmaEffectEmitter();
  emitter2.SetFrequency(new PVector(PI / 7.3, PI / 5.2, PI / 1.1));
  emitter2.SetCenterX(48);
  emitter2.SetCenterY(48);

  PlasmaEffectEmitter emitter3 = new PlasmaEffectEmitter();
  emitter3.SetFrequency(new PVector(PI / 4.8, PI / 3.1, PI / 9.4));  
  emitter3.SetCenterX(16);
  emitter3.SetCenterY(16);
  
  plasma.AddEmitter(emitter1);
  plasma.AddEmitter(emitter2);
  plasma.AddEmitter(emitter3);
}

void draw()
{
  plasma.Render();
  println(frameRate);
}
