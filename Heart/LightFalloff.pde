/**
 * <code>LightFalloff</code> encapsulates functionality of <code>lightFalloff</code> method.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class LightFalloff
{
  private float constant;
  private float linear;
  private float quadratic;
  
  /**
   * Gets current light falloff constant.
   * @return current light falloff constant value
   */
  public float GetConstant()
  {
    return constant;
  }
  
  /**
   * Sets current light falloff constant.
   * @param value new light falloff constant value
   */
  public void SetConstant(float value)
  {
    if (value >= 0 && value <= 1)
    {
      constant = value;
    }
  }

  /**
   * Gets current light falloff linear.
   * @return current light falloff linear value
   */
  public float GetLinear()
  {
    return linear;
  }
  
  /**
   * Sets current light falloff linear.
   * @param value new light falloff linear value
   */
  public void SetLinear(float value)
  {
    if (value >= 0 && value <= 1)
    {
      linear = value;
    }
  }

  /**
   * Gets current light falloff quadratic.
   * @return current light falloff quadratic value
   */
  public float GetQuadratic()
  {
    return quadratic;
  }
  
  /**
   * Sets current light falloff quadratic.
   * @param value new light falloff quadratic value
   */  
  public void SetQuadratic(float value)
  {
    if (value >= 0 && value <= 1)
    {
      quadratic = value;
    }
  }
  
  /**
   * Creates new <code>LightFalloff</code> with default values.
   * <ul>
   * <li> Constant is <code>1.0</code>
   * <li> Linear is <code>0.0</code>
   * <li> Quadratic is <code>0.0</code>
   * </ul>
   */
  public LightFalloff()
  {
    constant = 1.0;
    linear = 0.0;
    quadratic = 0.0;
  }
  
  /**
   * Applies <code>lightFalloff</code> method with current <code>constant, linear, quadratic</code> values.
   */
  public void Apply()
  {
    lightFalloff(constant, linear, quadratic);
  }
}
