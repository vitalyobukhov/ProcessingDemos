/**
 * <code>World</code> class encapsulates all world objects and their settings.
 * @author Vitaly Obukhov
 * @version 1.0
 */
private class World
{
  WorldTransformer worldTransformer;
  WorldLight worldLight;
  ImplicitFunctionPlotter implicitFunctionPlotter;

  /**
   * Gets current WorldTransformer instance.
   * @return current WorldTransformer instance
   */
  private WorldTransformer GetWorldTransformer()
  {
    return worldTransformer;
  }

  /**
   * Gets current WorldLight instance.
   * @return current WorldLight instance
   */
  private WorldLight GetWorldLight()
  {
    return worldLight;
  }
  
  /**
   * Gets current ImplicitFunctionPlotter instance.
   * @return current ImplicitFunctionPlotter instance
   */
  private ImplicitFunctionPlotter GetImplicitFunctionPlotter()
  {
    return implicitFunctionPlotter;
  }

  /**
   * Initializes world transformer
   */
  private void initWorldTransformer()
  {
    worldTransformer = new WorldTransformer();
    worldTransformer.SetTranslation(new PVector(width, height * 1.05, -height * 10));
    worldTransformer.SetRotation(new PVector(PI / 8.0 * 3.0, 0, -QUARTER_PI));
    worldTransformer.SetScaling(200);
  }
  
  /**
   * Initializes world light
   */
  private void initWorldLight()
  {
    worldLight = new WorldLight();
    
    AmbientLight worldAmbientLight = worldLight.GetAmbientLight();
    worldAmbientLight.SetColor(#404040);
    worldAmbientLight.SetCoordinate(new PVector(12, 12, 12));
    
    Material worldMaterial = worldLight.GetMaterial();
    worldMaterial.SetSpecular(#404040);
    worldMaterial.SetShininess(1);
    
    SpotLight sunSpotLight = new SpotLight();
    sunSpotLight.SetColor(#FFFFFF);
    sunSpotLight.SetCoordinate(new PVector(6, 6, 6));
    sunSpotLight.SetDirection(new PVector(-1, -1, -1));
    sunSpotLight.SetAngle(PI / 16.0);
    sunSpotLight.SetConcentration(100);
    worldLight.GetSpotLight().Add(sunSpotLight);
  }
  
  /**
   * Initializes implicit function plotter
   */
  private void initImplicitFunctionPlotter()
  {
    implicitFunctionPlotter = new ImplicitFunctionPlotter(new HeartFunction());
    implicitFunctionPlotter.SetDelta(new PVector(0.1, 0.1, 0.1));
    implicitFunctionPlotter.SetOutlineWeight(1);
    implicitFunctionPlotter.SetVoxelColor(0xFFFF0000);
    implicitFunctionPlotter.SetOutlineColor(0xFFD02020);
    implicitFunctionPlotter.SetOutlineWeight(2);
    implicitFunctionPlotter.SetPlotType(2);
  }

  /**
   * Creates new <code>World</code> instance
   */
  public World()
  {
    initWorldTransformer();
    initWorldLight();
    initImplicitFunctionPlotter();
  }
  
  /**
   * Render all world objects
   */
  public void Render()
  {
    background(#000000);
    worldTransformer.Apply();
    worldLight.Render();
    implicitFunctionPlotter.Render();
  }
}
