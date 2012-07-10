/**
 * <code>AmbientLight</code> encapsulates functionality of <code>ambientLight</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class AmbientLight
{
  private color lightColor;
  private PVector coordinate;
  
  /**
   * Gets current ambient light color.
   * @return current ambient light color value.
   */
  public color GetColor()
  {
    return lightColor;
  }
  
  /**
   * Sets current ambient light color.
   * @param value new ambient light color value
   */
  public void SetColor(color value)
  {
    lightColor = value;
  }
  
  /**
   * Gets current ambient light coordinate.
   * @return current ambient light coordinate value
   */
  public PVector GetCoordinate()
  {
    return new PVector(coordinate.x, coordinate.y, coordinate.z);
  }
  
  /**
   * Sets current ambient light coordinate.
   * @param value new ambient light coordinate value
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
   * Creates new <code>AmbientLight</code> with default values.
   * <ul>
   * <li> Color is <code>#FFFFFF</code>
   * <li> Coordinate is <code>PVector(0, 0, 0)</code>
   * </ul>
   */
  public AmbientLight()
  {
    lightColor = color(255, 255, 255);
    coordinate = new PVector(0, 0, 0);
  }
  
  /**
   * Applies <code>ambientLight</code> method with current <code>color, coordinate</code> values.
   */
  public void Apply()
  {
    ambientLight(red(lightColor), green(lightColor), blue(lightColor), 
      coordinate.x, coordinate.y, coordinate.z);
  }
}
