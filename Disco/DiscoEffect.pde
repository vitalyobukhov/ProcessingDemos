public class DiscoEffect
{
  private PGraphics canvas;
  private PVector effectSize;
  private  PVector tileCount;
  private PVector tileHueDelta;
  private PVector tileBrightnessFrequency;
  private PVector tileSaturation;
  private PVector tileBrightnessBase;
  private PVector tileBrightnessOffset;
  
  private boolean isInitialized;
  private PVector tileSize;
  private DiscoEffectTile[] tiles;
  
  public PGraphics GetCanvas()
  {
    return canvas;
  }
  
  public PVector GetSize()
  {
    return new PVector(effectSize.x, effectSize.y);
  }
  
  public void SetSize(PVector value)
  {
    if (value != null && value.x > 0 && value.y > 0)
    {
      effectSize.x = value.x;
      effectSize.y = value.y;
      isInitialized = false;
    }
  }
  
  public PVector GetTileCount()
  {
    return new PVector(tileCount.x, tileCount.y);
  }
  
  public void SetTileCount(PVector value)
  {
    if (value != null && value.x <= effectSize.x && value.y <= effectSize.y)
    {
      tileCount.x = value.x;
      tileCount.y = value.y;
      isInitialized = false;
    }
  }
  
  public PVector GetHueDelta()
  {
    return new PVector(tileHueDelta.x, tileHueDelta.y);
  }
  
  public void SetHueDelta(PVector value)
  {
    if (value != null && value.x <= value.y && value.x >= 0 && value.y >= 0)
    {
      tileHueDelta.x = value.x;
      tileHueDelta.y = value.y;
      isInitialized = false;
    }
  }
  
  public PVector GetBrightnessFrequency()
  {
    return new PVector(tileBrightnessFrequency.x, tileBrightnessFrequency.y);
  }
  
  public void SetBrightnessFrequency(PVector value)
  {
    if (value != null && value.x <= value.y && value.x >= 0 && value.y >= 0)
    {
      tileBrightnessFrequency.x = value.x;
      tileBrightnessFrequency.y = value.y;
      isInitialized = false;
    }
  }  
  
  public PVector GetSaturation()
  {
    return new PVector(tileSaturation.x, tileSaturation.y);
  }
  
  public void SetSaturation(PVector value)
  {
    if (value != null && value.x <= value.y && value.x >= 0 && value.y >= 0 && value.x <= 255 && value.y <= 255)
    {
      tileSaturation.x = value.x;
      tileSaturation.y = value.y;
      isInitialized = false;
    }
  }
  
  public PVector GetBrightnessBase()
  {
    return new PVector(tileBrightnessBase.x, tileBrightnessBase.y);
  }
  
  public void SetBrightnessBase(PVector value)
  {
    if (value != null && value.x <= value.y && value.x >= 0 && value.y >= 0 && value.x <= 255 && value.y <= 255)
    {
      tileBrightnessBase.x = value.x;
      tileBrightnessBase.y = value.y;
      isInitialized = false;
    }
  }  
  
  public PVector GetBrightnessOffset()
  {
    return new PVector(tileBrightnessOffset.x, tileBrightnessOffset.y);
  }
  
  public void SetBrightnessOffset(PVector value)
  {
    if (value != null && value.x <= value.y && value.x >= 0 && value.y >= 0 && value.x <= 255 && value.y <= 255)
    {
      tileBrightnessOffset.x = value.x;
      tileBrightnessOffset.y = value.y;
      isInitialized = false;
    }
  } 
  
  public DiscoEffect()
  {
    canvas = createGraphics(width, height, P2D);
    effectSize = new PVector(width, height);
    tileCount = new PVector(1, 1);
    tileHueDelta = new PVector(0.01, 1.0);
    tileBrightnessFrequency = new PVector(PI / 128.0, PI / 32.0);
    tileSaturation = new PVector (128, 255);
    tileBrightnessBase = new PVector(64, 192);
    tileBrightnessOffset = new PVector(0, 63);
    isInitialized = false;
  }
  
  public void Initialize()
  {
    tileSize = new PVector(effectSize.x / tileCount.x, effectSize.y / tileCount.y);
    
    tiles = new DiscoEffectTile[int(tileCount.y) * int(tileCount.x)];
    
    for(int y = 0; y < tileCount.y; y++)
    {
      for(int x = 0; x < tileCount.x; x++)
      {
        DiscoEffectTile tile = new DiscoEffectTile();
        
        tile.SetCoordinate(new PVector(x * tileSize.x, y * tileSize.y));
        tile.SetHue(random(0, 255.0));
        tile.SetHueDelta(random(tileHueDelta.x, tileHueDelta.y));
        tile.SetBrightnessFrequency(random(tileBrightnessFrequency.x, tileBrightnessFrequency.y));
        tile.SetSaturation(random(tileSaturation.x, tileSaturation.y));
        tile.SetBrightnessBase(random(tileBrightnessBase.x, tileBrightnessBase.y));
        tile.SetBrightnessOffset(random(tileBrightnessOffset.x, tileBrightnessOffset.y));
        
        tiles[y * int(tileCount.x) + x] = tile;
      }
    }
    
    isInitialized = true;
  }
  
  public void DrawToCanvas()
  {
    colorMode(HSB, 255, 255, 255, 255);
    
    if (!isInitialized)
    {
      Initialize();
    }
    
    canvas.beginDraw();
    canvas.loadPixels();
    
    
    for(int i = 0; i < tiles.length; i++)
    {
      DiscoEffectTile tile = tiles[i];
      
      float nextHue = tile.GetHue() + tile.GetHueDelta();
      nextHue = nextHue > 255 ? 0 : nextHue;
      
      color tileColor = color(nextHue > 255 ? 0 : nextHue,
        tile.GetSaturation(),
        tile.GetBrightnessBase() + tile.GetBrightnessOffset() * sin(tile.GetBrightnessFrequency() * frameCount));
      
      tile.SetHue(nextHue);
      
      PVector coordinate = tile.GetCoordinate();
      
      for(int y = (int)coordinate.y; y < (int)coordinate.y + (int)tileSize.y; y++)
      {
        for(int x = (int)coordinate.x; x < (int)coordinate.x + (int)tileSize.x; x++)
        {
          canvas.pixels[(int)effectSize.x * y + x] = tileColor;
        }
      }
    }
    
    canvas.updatePixels();
    canvas.endDraw();
  }
}
