/**
 * <code>HeartFunction</code> implements calculation of heart shaped surface
 * @author Vitaly Obukhov
 * @version 1.0
 */
public class HeartFunction implements IImplicitFunction
{
  /**
   * Calculates value of function in specified point of space
   * @param v point of space
   * @return value of function in specified point
   */
  public float Calculate(PVector v)
  {
    return pow(sq(v.x) + 9.0 / 4.0 * sq(v.y) + sq(v.z) - 1, 3) - sq(v.x) * pow(v.z, 3) - 9.0 / 80.0 * sq(v.y) * pow(v.z, 3);
  }
  
  /**
   * Gets left part coordinates of space restriction
   * @return left part coordinates of space restriction
   */
  public PVector GetLeftBoundary()
  {
    return new PVector(-2.0, -2.0, -2.0);
  }
  
  /**
   * Gets right part coordinates of space restriction
   * @return right part coordinates of space restriction
   */
  public PVector GetRightBoundary()
  {
    return new PVector(2.0, 2.0, 2.0);
  }
}
