/**
 * <code>SpotLight</code> encapsulates functionality of <code>spotLight</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class SpotLight implements IRenderableLight
{
  private color lightColor;
  private PVector coordinate;
  private PVector direction;
  private float angle;
  private float concentration;
  
  /**
   * Gets current spot light color.
   * @return current spot light color value
   */
  public color GetColor()
  {
    return lightColor;
  }
  
  /**
   * Sets current spot light color.
   * @param value new spot light color value
   */
  public void SetColor(color value)
  {
    lightColor = value;
  }
  
  /**
   * Gets current spot light coordinate.
   * @return current spot light color coordinate
   */
  public PVector GetCoordinate()
  {
    return new PVector(coordinate.x, coordinate.y, coordinate.z);
  }
  
  /**
   * Sets current spot light coordinate.
   * @param value new spot light coordinate value
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
   * Gets current spot light direction.
   * @return current spot light color direction
   */
  public PVector GetDirection()
  {
    return new PVector(direction.x, direction.y, direction.z);
  }
  
  /**
   * Sets current spot light direction.
   * @param value new spot light direction value
   */
  public void SetDirection(PVector value)
  {
    if (value != null)
    {
      direction.x = value.x;
      direction.y = value.y;
      direction.z = value.z;
    }
  }

  /**
   * Gets current spot light angle.
   * @return current spot light angle value
   */
  public float GetAngle()
  {
    return angle;
  }
  
  /**
   * Sets current spot light angle.
   * @param value new spot light angle value
   */
  public void SetAngle(float value)
  {
    angle = value;
  }
  
  /**
   * Gets current spot light concentration.
   * @return current spot light angle concentration
   */
  public float GetConcentration()
  {
    return concentration;
  }
  
  /**
   * Sets current spot light concentration.
   * @param value new spot light angle concentration
   */
  public void SetConcentration(float value)
  {
    concentration = value;
  }
  
  /**
   * Creates new <code>SpotLight</code> with default values.
   * <ul>
   * <li> Color is <code>#FFFFFF</code>
   * <li> Coordinate is <code>PVector(0, 0, 0)</code>
   * <li> Direction is <code>PVector(0, 0, 0)</code>
   * <li> Angle is <code>PI / 8.0</code>
   * <li> Concentration is <code>1.0</code>
   * </ul>
   */
  public SpotLight()
  {
    lightColor = color(255, 255, 255);
    coordinate = new PVector(0, 0, 0);
    direction = new PVector(0, 0, 0);
    angle = PI / 8.0;
    concentration = 1.0;
  }
  
  /**
   * Renders spot light using <code>spotLight</code> method with current <code>lightColor, coordinate, direction, angle, concentration</code> values.
   */
  public void Render()
  {
    spotLight(red(lightColor), green(lightColor), blue(lightColor), 
      coordinate.x, coordinate.y, coordinate.z,
      direction.x, direction.y, direction.z,
      angle, concentration);
  }
}
