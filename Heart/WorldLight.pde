/**
 * <code>WorldLight</code> encapsulates all world light sources and their parameters.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class WorldLight
{
  private Material worldMaterial;
  private LightSpecular worldLightSpecular;
  private LightFalloff worldLightFalloff;
  private AmbientLight worldAmbientLight;
  private LightContainer<DirectionalLight> worldDirectionalLight;
  private LightContainer<PointLight> worldPointLight;
  private LightContainer<SpotLight> worldSpotLight;
  private boolean isEnabled;
  
  /**
   * Gets current material.
   * @return current <code>Material</code> object
   */
  public Material GetMaterial()
  {
    return worldMaterial;
  }
  
  /**
   * Gets current light specular.
   * @return current <code>LightSpecular</code> object
   */
  public LightSpecular GetLightSpecular()
  {
    return worldLightSpecular;
  }
  
  /**
   * Gets current light falloff.
   * @return current <code>LightFalloff</code> object
   */
  public LightFalloff GetLightFalloff()
  {
    return worldLightFalloff;
  }
  
  /**
   * Gets current ambient light.
   * @return current <code>AmbientLight</code> object
   */
  public AmbientLight GetAmbientLight()
  {
    return worldAmbientLight;
  }
  
  /**
   * Gets current directional light container.
   * @return current <code>LightContainer<DirectionalLight></code> object
   */
  public LightContainer<DirectionalLight> GetDirectionalLight()
  {
    return worldDirectionalLight;
  }
  
  /**
   * Gets current point light container.
   * @return current <code>LightContainer<PointLight></code> object
   */
  public LightContainer<PointLight> GetPointLight()
  {
    return worldPointLight;
  }  
  
  /**
   * Gets current spot light container.
   * @return current <code>LightContainer<SpotLight></code> object
   */
  public LightContainer<SpotLight> GetSpotLight()
  {
    return worldSpotLight;
  }    
  
  /**
   * Sets world lights rendering to enabled state
   */
  public void Enable()
  {
    isEnabled = true;
    lights();
  }
  
  /**
   * Sets world lights rendering to disabled state
   */
  public void Disable()
  {
    isEnabled = false;
    noLights();
  }
  
  /**
   * Creates new <code>WorldLight</code> object with default parameters of incapsulated objects
   */
  public WorldLight()
  {
    worldMaterial = new Material();
    worldAmbientLight = new AmbientLight();
    worldLightSpecular = new LightSpecular();
    worldLightFalloff = new LightFalloff();
    worldDirectionalLight = new LightContainer<DirectionalLight>();
    worldPointLight = new LightContainer<PointLight>();
    worldSpotLight = new LightContainer<SpotLight>();
    Enable();
  }
  
  /**
   * Is world lights rendering is enabled - renders all world light sources
   */
  public void Render()
  {
    if (isEnabled)
    {
      worldMaterial.Apply();
      worldLightSpecular.Apply();
      worldLightFalloff.Apply();
      worldAmbientLight.Apply();
      worldDirectionalLight.RenderAllLights();
      worldPointLight.RenderAllLights();
      worldSpotLight.RenderAllLights();
    }
  }
}
