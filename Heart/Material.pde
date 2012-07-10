/**
 * <code>Material</code> encapsulates functionality of <code>ambient, emissive, shininess, specular</code> methods.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class Material
{
  private color ambientPart;
  private color emissivePart;
  private float shininessPart;
  private color specularPart;
  
  /**
   * Gets ambient part of material
   * @return ambient part of material value
   */
  public color GetAmbient()
  {
    return ambientPart;
  }
  
  /**
   * Set ambient part of material
   * @param value ambient part of material value
   */
  public void SetAmbient(color value)
  {
    ambientPart = value;
  }
  
  /**
   * Gets emissive part of material
   * @return emissive part of material value
   */
  public color GetEmissive()
  {
    return emissivePart;
  }
  
  /**
   * Set emissive part of material
   * @param value emissive part of material value
   */
  public void SetEmissive(color value)
  {
    emissivePart = value;
  }
  
  /**
   * Gets shininess part of material
   * @return shininess part of material value
   */
  public float GetShininess()
  {
    return shininessPart;
  }
  
  /**
   * Set shininess part of material
   * @param value shininess part of material value
   */
  public void SetShininess(float value)
  {
    if (value >= 0 && value <= 1)
    {
      shininessPart = value;
    }
  }
  
  /**
   * Gets specular part of material
   * @return specular part of material value
   */
  public color GetSpecular()
  {
    return specularPart;
  }
  
  /**
   * Set specular part of material
   * @param value specular part of material value
   */
  public void SetSpecular(color value)
  {
    specularPart = value;
  }
  
  /**
   * Creates new <code>Material</code> with default values.
   * <ul>
   * <li> Ambient is <code>#FFFFFF</code>
   * <li> Emissive is <code>#000000</code>
   * <li> Shininess is <code>0.0</code>
   * <li> Specular is <code>#000000</code>   
   * </ul>
   */
  public Material()
  {
    ambientPart = color(255, 255, 255);
    emissivePart = color (0, 0, 0);
    shininessPart = 0.0;
    specularPart = color(0, 0, 0);
  }
  
  /**
   * Applies <code>ambient, emissive, shininess, specular</code> methods with current values.
   */
  public void Apply()
  {
    ambient(ambientPart);
    emissive(emissivePart);
    shininess(shininessPart);
    specular(specularPart);
  }
}
