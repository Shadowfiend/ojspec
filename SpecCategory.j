var SpecFailedException = "specFailedException";
var currentPreFn, currentPostFn;

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
  var currentContext = {};
  for (var prop in this)
    currentContext[prop] = this[prop];

  try
  {
    if (currentPreFn) currentPreFn.call(currentContext);
    specFn.call(currentContext);
    if (currentPostFn) currentPostFn.call(currentContext);

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

+ setCurrentPre: (Function)preFn andPost: (Function)postFn
{
  currentPreFn = preFn;
  currentPostFn = postFn;
}

+ (bool)methodSignatureForSelector: (SEL)aSelector
{
  var selector = CPStringFromSelector(aSelector);

  if (selector.match(/^for:(when:)?(beforeAll:)?(beforeEach:)?checking:(afterEach:)?(afterAll:)?$/))
    return true;
}

+ (void)forwardInvocation: (CPInvocation)anInvocation
{
  var selector = CPStringFromSelector([anInvocation selector]);
  var match =
    selector.match(/^(for:)(when:)?(beforeAll:)?(beforeEach:)?(checking:)(afterEach:)?(afterAll:)?$/);

  if (match)
  {
    match = match.slice(1); // drop full string match

    // Construct an invocation for the full method.
    var newArgs = []; // for passing to the full method
    var currentInvocationArg = 2; // out of the args passed to this invocation
    match.forEach(function(foundArg) {
      if (foundArg)
      {
        newArgs.push([anInvocation argumentAtIndex: currentInvocationArg]);
        currentInvocationArg++;
      }
      else
        newArgs.push(null);
    });

    var invocation = [CPInvocation invocationWithMethodSignature: null];
    [invocation setSelector: @selector(for:when:beforeAll:beforeEach:checking:afterEach:afterAll:)];
    newArgs.forEach(function(arg, index) {
      // Index is + 2 to leave space for self and _cmd.
      [invocation setArgument: arg atIndex: index + 2]
    });

    [invocation invokeWithTarget: self]
  }
  else
    [super forwardInvocation: anInvocation]
}

@end
