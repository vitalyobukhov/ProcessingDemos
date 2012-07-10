/**
 * <code>LightContainer<TLight></code> describes container for <code>IRenderableLight</code> objects with basic list-like manipulation methods.
 * @author Vitaly Obukhov
 * @param <TLight> type of light which implements <code>IRenderableLight</code> interface
 * @version 1.0
 */
public class LightContainer<TLight extends IRenderableLight>
{
  private List<TLight> lightList;
  
  /**
   * Adds new light source to container.
   * @param light light source
   */
  public void Add(TLight light)
  {
    lightList.add(light);
  }
  
  /**
   * Clears current container.
   */
  public void Clear()
  {
    lightList.clear();
  }
  
  /**
   * Gets light source from container.
   * @param index index of light source in container
   * @return light source
   */
  public TLight Get(int index)
  {
    return lightList.get(index);
  }
  
  /**
   * Remove light source from container by index.
   * @param index index of light source in container
   */
  public void RemoveAt(int index)
  {
    lightList.remove(index);
  }
  
  /**
   * Remove light source from container.
   * @param light light source in container
   */
  public void Remove(TLight light)
  {
    lightList.remove(light);
  }
  
  /**
   * Gets number of light sources in container.
   * @return number of light sources in container 
   */
  public void Size()
  {
    lightList.size();
  }
  
  /**
   * Creates new <code>LightContainer</code> with empty container.
   */
  public LightContainer()
  {
    lightList = new ArrayList<TLight>();
  }
  
  /**
   * Renders all lights in container using <code>IRenderableLight.Render()</code> method.
   */
  public void RenderAllLights()
  {
    for(int i = 0; i < lightList.size(); i++)
      lightList.get(i).Render();
  }
}
