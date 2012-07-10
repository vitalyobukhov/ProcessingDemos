public class PlasmaEffect
{
  private List<PlasmaEffectEmitter> emitters;
  private int resX;
  private int resY;
  private PGraphics canvas;
  
  public void AddEmitter(PlasmaEffectEmitter emitter)
  {
    emitters.add(emitter);
  }
  
  public PlasmaEffectEmitter GetEmitter(int index)
  {
    PlasmaEffectEmitter result = null;
    if (index >= 0 && index < emitters.size())
    {
      result = emitters.get(index);
    }
    return result;
  }
  
  public void RemoveEmitter(int index)
  {
    if (index >= 0 && index < emitters.size())
    {
      emitters.remove(index);
    }
  }
  
  public void RemoveEmitter(PlasmaEffectEmitter emitter)
  {
    if (emitters.contains(emitter))
    {
      emitters.remove(emitter);
    }
  }
  
  public void ClearEmitters()
  {
    emitters.clear();
  }
  
  public int CountEmitter()
  {
    return emitters.size();
  }
  
  public int GetResolutionX()
  {
    return resX;
  }
  
  public void SetResolutionX(int value)
  {
    if (resX > 0 && resX <= width)
    {
      resX = value;
      canvas = createGraphics(resX, resY, P3D);
    }
  }
  
  public int GetResolutionY()
  {
    return resY;
  }
  
  public void SetResolutionY(int value)
  {
    if (resY > 0 && resY <= width)
    {
      resY = value;
      canvas = createGraphics(resX, resY, P3D);
    }
  }
  
  public PlasmaEffect()
  {
    resX = width;
    resY = height;
    emitters = new ArrayList<PlasmaEffectEmitter>();
    canvas = createGraphics(resX, resY, P3D);
  }
  
  public void Render()
  {
    canvas.beginDraw();
    canvas.loadPixels();
    
    for(int y = 0; y < resY; y++)
    {
      for(int x = 0; x < resX; x++)
      {
        PVector sum = new PVector(0, 0, 0);
        for(int i = 0; i < emitters.size(); i++)
        {
          PlasmaEffectEmitter emitter = emitters.get(i);
          PVector item = emitter.GetValue(x, y);
          sum.x += item.x;
          sum.y += item.y;
          sum.z += item.z;
        }
        sum.x = constrain(sum.x, -1, 1);
        sum.y = constrain(sum.y, -1, 1);
        sum.z = constrain(sum.z, -1, 1);
        canvas.pixels[y * resX + x] = color(
          int(128 + 128 * sum.x),
          int(128 + 128 * sum.y),
          int(128 + 128 * sum.z));
      }
    }
    
    canvas.updatePixels();
    canvas.endDraw();
    
    image(canvas, 0, 0, width, height);
  }
}
