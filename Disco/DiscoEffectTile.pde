private class DiscoEffectTile
{
  private PVector coordinate;
  private float tileHue;
  private float tileHueDelta;
  private float tileBrightnessFrequency;
  private float tileSaturation;
  private float tileBrightnessBase;
  private float tileBrightnessOffset;
  
  public PVector GetCoordinate()
  {
    return new PVector(coordinate.x, coordinate.y);
  }
  
  public void SetCoordinate(PVector value)
  {
    if (value != null && value.x >= 0 && value.y >= 0)
    {
      coordinate.x = value.x;
      coordinate.y = value.y;
    }
  }

  public float GetHue()
  {
    return tileHue;
  }
  
  public void SetHue(float value)
  {
    if (value >=0 && value <= 255)
    {
      tileHue = value;
    }
  }

  public float GetHueDelta()
  {
    return tileHueDelta;
  }
  
  public void SetHueDelta(float value)
  {
    if (value >= 0)
    {
      tileHueDelta = value;
    }
  }
  
  public float GetBrightnessFrequency()
  {
    return tileBrightnessFrequency;
  }
  
  public void SetBrightnessFrequency(float value)
  {
    if (value >= 0)
    {
      tileBrightnessFrequency = value;
    }
  }
  
  public float GetSaturation()
  {
    return tileSaturation;
  }
  
  public void SetSaturation(float value)
  {
    if (value >= 0 && value <= 255)
    {
      tileSaturation = value;
    }
  }

  public float GetBrightnessBase()
  {
    return tileBrightnessBase;
  }
  
  public void SetBrightnessBase(float value)
  {
    if (value >= 0 && value <= 255)
    {
      tileBrightnessBase = value;
    }
  }

  public float GetBrightnessOffset()
  {
    return tileBrightnessOffset;
  }
  
  public void SetBrightnessOffset(float value)
  {
    if (value >= 0 && value <= 255)
    {
      tileBrightnessOffset = value;
    }
  }
 
  public DiscoEffectTile()
  {
    coordinate = new PVector(0, 0);
    tileHue = 0;
    tileHueDelta = 0;
    tileBrightnessFrequency = 0;
    tileSaturation = 0;
    tileBrightnessBase = 0;
    tileBrightnessOffset = 0;
  }
}
