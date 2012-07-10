/**
 * <code>DirectionalLight</code> encapsulates functionality of <code>directionalLight</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class DirectionalLight implements IRenderableLight
{
  private color lightColor;
  private PVector direction;
  
  /**
   * Gets current directional light color.
   * @return current directional light color value.
   */
  public color GetColor()
  {
    return lightColor;
  }
  
  /**
   * Sets current directional light color.
   * @param value new directional light color value
   */
  public void SetColor(color value)
  {
    lightColor = value;
  }
  
  /**
   * Gets current directional light direction.
   * @return current directional light direction value
   */
  public PVector GetDirection()
  {
    return new PVector(direction.x, direction.y, direction.z);
  }
  
  /**
   * Sets current directional light direction.
   * @param value new directional light direction value
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
   * Creates new <code>DirectionalLight</code> with default values.
   * <ul>
   * <li> Color is <code>#FFFFFF</code>
   * <li> Direction is <code>PVector(0, 0, 0)</code>
   * </ul>
   */
  public DirectionalLight()
  {
    lightColor = color(255, 255, 255);
    direction = new PVector(0, 0, 0);
  }
  
  /**
   * Renders directional light using <code>directionalLight</code> method with current <code>color, direction</code> values.
   */
  public void Render()
  {
    directionalLight(red(lightColor), green(lightColor), blue(lightColor),
      direction.x, direction.y, direction.z);
  }
}
