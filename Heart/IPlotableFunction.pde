/**
 * <code>IPlotableFunction</code> describes interface of function class which could be calculated in any point of some restricted space
 * @author Vitaly Obukhov
 * @version 1.0
 */
public interface IImplicitFunction
{
  /**
   * Calculates value of function in specified point of space
   * @param v point of space
   * @return value of function in specified point
   */
  float Calculate(PVector v);
  
  /**
   * Gets left part coordinates of space restriction
   * @return left part coordinates of space restriction
   */
  PVector GetLeftBoundary();
  
  /**
   * Gets right part coordinates of space restriction
   * @return right part coordinates of space restriction
   */
  PVector GetRightBoundary();
}
