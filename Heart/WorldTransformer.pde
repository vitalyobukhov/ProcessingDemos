/**
 * <code>WorldTransformer</code> encapsulates funclionality of <code>translate, rotate, scale</code> methods and their current values.
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class WorldTransformer
{
  private PVector rotation;
  private PVector translation;
  private PVector scaling;
  
  /**
   * Gets current rotation vector.
   * @return current rotation vector
   */
  public PVector GetRotation()
  {
    return new PVector(rotation.x, rotation.y, rotation.z);
  }
  
  /**
   * Sets current rotation vector.
   * @param v new rotation vector
   */
  public void SetRotation(PVector v)
  {
    if (v != null)
    {
      rotation.x = v.x % TWO_PI;
      rotation.y = v.y % TWO_PI;
      rotation.z = v.z % TWO_PI;
    }
  }
  
  /**
   * Gets current translation vector.
   * @return current translation vector
   */
  public PVector GetTranslation()
  {
    return new PVector(translation.x, translation.y, translation.z);
  }
  
  /**
   * Sets current translation vector.
   * @param v new translation vector
   */
  public void SetTranslation(PVector v)
  {
    if (v != null)
    {
      translation.x = v.x;
      translation.y = v.y;
      translation.z = v.z;
    }
  }
  
  /**
   * Gets current scaling vector.
   * @return current scaling vector
   */
  public PVector GetScaling()
  {
    return new PVector(scaling.x, scaling.y, scaling.z);
  }

  /**
   * Sets current scaling vector.
   * @param value new scaling coordinates value (uniform scaling)
   */
  public void SetScaling(float value)
  {
    scaling.x = value;
    scaling.y = value;
    scaling.z = value;
  }
  
  /**
   * Sets current scaling vector.
   * @param v new scaling vector
   */
  public void SetScaling(PVector v)
  {
    if (v != null)
    {
      scaling.x = v.x;
      scaling.y = v.y;
      scaling.z = v.z;
    }
  }

  /**
   * Creates new <code>WorldTransformer</code> object with default values
   * <ul>
   * <li> Rotation is <code>PVector(0, 0, 0)</code>
   * <li> Translation is <code>PVector(0, 0, 0)</code>
   * <li> Scaling is <code>PVector(1, 1, 1)</code>
   * </ul>
   */
  public WorldTransformer()
  {
    rotation = new PVector(0, 0, 0);
    translation = new PVector(0, 0, 0);
    scaling = new PVector(1, 1, 1);
  }
  
  /**
   * Applies <code>translate, rotate, scale</code> methods using current parameters
   */
  public void Apply()
  {
    translate(translation.x, translation.y, translation.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    scale(scaling.x, scaling.y, scaling.z);
  }
}

