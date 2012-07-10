/**
 * <code>PointLight</code> encapsulates functionality of <code>pointLight</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class PointLight implements IRenderableLight
{
  private color lightColor;
  private PVector coordinate;
  
  /**
   * Gets current point light color.
   * @return current point light color value
   */
  public color GetColor()
  {
    return lightColor;
  }
  
  /**
   * Sets current point light color.
   * @param value new point light color value
   */
  public void SetColor(color value)
  {
    lightColor = value;
  }
  
  /**
   * Gets current point light coordinate.
   * @return current point light coordinate value
   */
  public PVector GetCoordinate()
  {
    return new PVector(coordinate.x, coordinate.y, coordinate.z);
  }
  
  /**
   * Sets current point light coordinate.
   * @param value new point light coordinate value
   */
  public void SetCoordinate(PVector value)
  {
    if (value != null)
    {
      coordinate.x = value.x;
      coordinate.y = value.y;
      coordinate.z = value.z;
    }
  }
  
  /**
   * Creates new <code>PointLight</code> with default values.
   * <ul>
   * <li> Color is <code>#FFFFFF</code>
   * <li> Coordinate is <code>PVector(0, 0, 0)</code>
   * </ul>
   */
  public PointLight()
  {
    lightColor = color(255, 255, 255);
    coordinate = new PVector(0, 0, 0);
  }
  
  /**
   * Renders directional light using <code>pointLight</code> method with current <code>color, coordinate</code> values.
   */
  public void Render()
  {
    pointLight(red(lightColor), green(lightColor), blue(lightColor), 
      coordinate.x, coordinate.y, coordinate.z);
  }
}
