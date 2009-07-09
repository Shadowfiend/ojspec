var SpecFailedException = "specFailedException";

@implementation CPObject (Specs)

+ should: (CPString)specDescription by: (Function)specFn
{
  try
  {
    specFn();
    [Test addSuccess: specDescription]
  }
  catch (SpecFailedException)
  {
    [Test addFailure: specDescription]
  }
}

- shouldEqual: expected
{
  if (this != expected)
    throw SpecFailedException();
}

@end
