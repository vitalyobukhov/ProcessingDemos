/**
 * <code>VoxelFunctionPlotter</code> implicit 3d function plotter.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class ImplicitFunctionPlotter
{ 
  private IImplicitFunction function;
  private PVector left;
  private PVector right;
  private PVector delta;
  private color voxelColor;
  private color outlineColor;
  private int outlineWeight;
  private int plotType;

  private boolean isCalculated;
  private List<PVector> voxelPoints;

  /**
   * Gets left part coordinates of space restriction.
   * @return left part coordinates of space restriction
   */
  public PVector GetLeftBoundary()
  {
    return new PVector(left.x, left.y, left.z);
  }

  /**
   * Sets left part coordinates of space restriction.
   * @param value new left part coordinates of space restriction
   */
  public void SetLeftBoundary(PVector value)
  {
    if (value != null)
    {
      left.x = value.x;
      left.y = value.y;
      left.z = value.z;
      isCalculated = false;
    }
  }

  /**
   * Gets right part coordinates of space restriction.
   * @return right part coordinates of space restriction
   */
  public PVector GetRightBoundary()
  {
    return new PVector(right.x, right.y, right.z);
  }

  /**
   * Sets right part coordinates of space restriction.
   * @param value new right part coordinates of space restriction
   */
  public void SetRightBoundary(PVector value)
  {
    if (value != null)
    {
      right.x = value.x;
      right.y = value.y;
      right.z = value.z;
      isCalculated = false;
    }
  }

  /**
   * Gets delta value for space splitting.
   * @return delta value for space splitting
   */
  public PVector GetDelta()
  {
    return new PVector(delta.x, delta.y, delta.z);
  }

  /**
   * Sets delta value for space splitting.
   * @param value new delta value for space splitting
   */
  public void SetDelta(PVector value)
  {
    if (value != null)
    {
      delta.x = value.x;
      delta.y = value.y;
      delta.z = value.z;
      isCalculated = false;
    }
  }

  /**
   * Gets surface voxel fill color.
   * @return surface voxel fill color
   */
  public color GetVoxelColor()
  {
    return voxelColor;
  }

  /**
   * Sets surface voxel fill color.
   * @param value new surface voxel fill color
   */
  public void SetVoxelColor(color value)
  {
    voxelColor = value;
  }

  /**
   * Gets surface voxel outline color.
   * @return surface voxel outline color
   */
  public color GetOutlineColor()
  {
    return outlineColor;
  }

  /**
   * Sets surface voxel outline color.
   * @param value new surface voxel outline color
   */
  public void SetOutlineColor(color value)
  {
    outlineColor = value;
  }
  
  /**
   * Gets surface voxel outline weight.
   * @return surface voxel outline weight
   */
  public int GetOutlineWeight()
  {
    return outlineWeight; 
  }
  
  /**
   * Sets surface voxel outline weight.
   * @param value new surface voxel outline weight
   */
  public void SetOutlineWeight(int value)
  {
    if (value >= 0)
    {
      outlineWeight = value;
    }
  }
 
  /**
   * Gets plot style.
   * @return plot style
   */
  public int GetPlotType()
  {
    return plotType; 
  }

  /**
   * Sets plot style.
   * @param value new plot style
   */
  public void SetPlotType(int value)
  {
    if (value >=0 && value <= 2)
    {
      plotType = value;
    }
  }
 
  /**
   * Recalculates entire surface for first time or after parameters change.
   */
  public void ReCalculate()
  {
    if (function != null &&
      left.x <= right.x &&
      left.y <= right.y &&
      left.z <= right.z)
    {
      PVector voxelCounts = new PVector((right.x - left.x) / delta.x,
      (right.y - left.y) / delta.y, 
      (right.z - left.z) / delta.z);
  
    voxelPoints = new ArrayList<PVector>();
  
      final PVector[] offsets = {
        new PVector(0, 0, 0),
        new PVector(0, 0, 1),
        new PVector(0, 1, 0),
        new PVector(0, 1, 1),
        new PVector(1, 0, 0),
        new PVector(1, 0, 1),
        new PVector(1, 1, 0),
        new PVector(1, 1, 1)
      };
  
      for(int x = 0; x < voxelCounts.x; x++)
      {
        for(int y = 0; y < voxelCounts.y; y++)
        {
          for(int z = 0; z < voxelCounts.z; z++)
          {
            int negativeCount = 0;
  
            for(int i = 0; i < offsets.length; i++)
            {
              float value = function.Calculate(new PVector(left.x + (x + offsets[i].x) * delta.x,
                left.y + (y + offsets[i].y) * delta.y,
                left.z + (z + offsets[i].z) * delta.z));
  
              if (value <= 0)
              {
                negativeCount++;
              }
            }

            if (negativeCount > 0 && negativeCount < 8)
            {
              voxelPoints.add(new PVector(x, y, z));
            }
          }
        }
      }

      isCalculated = true;
    }
  }
  
  /**
   * Plots one voxel by given space indexes.
   * @param v indexes of space points from left boundary
   */
  private void PlotVoxel(PVector v)
  {
    switch(plotType)
    {
      case 0:
        beginShape(POINTS);
        
        vertex(left.x + delta.x * (v.x + 0.5), left.y + delta.y * (v.y + 0.5), left.z + delta.z * (v.z + 0.5)); 
        
        endShape();
        break;
        
      case 1:
        beginShape(LINES);
        
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);
        
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);
        
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);
        
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);
        
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);
        
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + v.z * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + (v.z + 1) * delta.z);   
        
        vertex(left.x + v.x * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + (v.y + 1) * delta.y, left.z + v.z * delta.z);   
        
        vertex(left.x + v.x * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        vertex(left.x + (v.x + 1) * delta.x, left.y + v.y * delta.y, left.z + (v.z + 1) * delta.z);
        
        endShape();
        break;
        
     case 2:
       pushMatrix();
    
       translate(left.x + delta.x * (v.x + 0.5),
         left.y + delta.y * (v.y + 0.5),
         left.z + delta.z * (v.z + 0.5));
       box(delta.x, delta.y, delta.z);
    
       popMatrix();
       break;
    }
  }

  /**
   * Plots the entire surface to scene.
   */
  public void Render()
  {
    if (!isCalculated)
    {
      ReCalculate();
    }

    if (isCalculated)
    {
      if (outlineWeight == 0 || alpha(outlineColor) == 0)
      {
        noStroke();
      }
      else
      {
        strokeWeight(outlineWeight);
        stroke(outlineColor);
      }
      
      if (alpha(voxelColor) == 0)
      {
        noFill();
      }
      else
      {
        fill(voxelColor);
      }
  
      for(int i = 0; i < voxelPoints.size(); i++)
      {
        PlotVoxel(voxelPoints.get(i));
      }
    }
  }

  /**
   * Creates new <code>VoxelFunctionPlotter</code> object with default values.
   * <ul>
   * <li> Left boundary is <code>function.GetLeftBoundary()</code>
   * <li> Right boundary is <code>function.GetRightBoundary()</code>
   * </ul> 
   */
  public ImplicitFunctionPlotter(IImplicitFunction function)
  {
    this.function = function;
    left = function.GetLeftBoundary();
    right = function.GetRightBoundary();
    delta = new PVector(0.1, 0.1, 0.1);
    voxelColor = #FFFFFF;
    outlineColor = #000000;
    outlineWeight = 1;
    plotType = 2;
    
    isCalculated = false;
    voxelPoints = new ArrayList<PVector>();
  }
}
