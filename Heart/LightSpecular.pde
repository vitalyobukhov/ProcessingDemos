/**
 * <code>LightSpecular</code> encapsulates functionality of <code>lightSpecular</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class LightSpecular
{
  private color lightColor;
  
  /**
   * Gets current light specular color.
   * @return current light specular color value
   */
  public color GetColor()
  {
    return lightColor;
  }
  
  /**
   * Sets current light specular color.
   * @param value new light specular color value
   */
  public void SetColor(color value)
  {
    lightColor = value;
  }
  
  /**
   * Creates new <code>LightSpecular</code> with default values.
   * <ul>
   * <li> Color is <code>#FFFFFF</code>
   * </ul>
   */
  public LightSpecular()
  {
    lightColor = color(255, 255, 255);
  }
  
  /**
   * Applies <code>lightSpecular</code> method with current <code>color</code> value.
   */
  public void Apply()
  {
    lightSpecular(red(lightColor), green(lightColor), blue(lightColor));
  }
}
