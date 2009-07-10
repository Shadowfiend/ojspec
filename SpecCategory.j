var SpecFailedException = "specFailedException";

@implementation CPObject (Specs)

/**
 *
 * @param specDescription A description of what this spec is testing. The
 *   description is automatically prefixed with ``should''.
 * @param by A block of code to run for this spec. It should make calls to the
 *   shouldEqual: or shouldNotEqual: methods.
 */
+ should: (CPString)specDescription by: (Function)specFn
{
  try
  {
    specFn();
    [Test addSuccess: specDescription]
  }
  catch (obj)
  {
    if (obj == SpecFailedException)
      [Test addFailure: specDescription]
    else
      [Test addFailure: specDescription fromException: obj];
  }
}

/**
 * Verifies that the receivier object is equal to the expected object. If not,
 * records a test as a failure. Should be run within the code block of the
 * should:by: method to work correctly.
 */
- shouldEqual: expected
{
  if (self != expected)
    throw SpecFailedException;
}

/**
 * Verifies that the receivier object is not equal to the expected object. If
 * not, records a test as a failure. Should be run within the code block of the
 * should:by: method to work correctly.
 */
- shouldNotEqual: expected
{
  if (self == expected)
    throw SpecFailedException;
}

@end
