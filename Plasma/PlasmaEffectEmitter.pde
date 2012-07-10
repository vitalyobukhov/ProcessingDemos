public class PlasmaEffectEmitter
{
  private PVector frequency;
  private int centerX;
  private int centerY;

  public PVector GetFrequency()
  {
    return new PVector(frequency.x, frequency.y, frequency.z);
  }
  
  public void SetFrequency(PVector value)
  {
    if (value != null)
    {
      frequency = value;
    }
  }
  
  public int GetCenterX()
  {
    return centerX;
  }
  
  public void SetCenterX(int value)
  {
    if (value >= 0)
    {
      centerX = value;
    }
  }
  
  public int GetCenterY()
  {
    return centerX;
  }
  
  public void SetCenterY(int value)
  {
    if (value >= 0)
    {
      centerY = value;
    }
  }
  
  public PlasmaEffectEmitter()
  {
    frequency = new PVector(0, 0, 0);
    centerX = 0;
    centerY = 0;
  }
  
  public PVector GetValue(int x, int y)
  {
    x -= centerX;
    y -= centerY;
    float metric = sqrt(x * x + y * y) + frameCount;
    return new PVector(
      sin(metric * frequency.x),
      sin(metric * frequency.y),
      sin(metric * frequency.z));
  } 
}
