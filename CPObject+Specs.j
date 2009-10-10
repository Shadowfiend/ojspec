
@import "OJMatcher.j"

@import "Matchers/OJBeInstanceOf.j"
@import "Matchers/OJBeNil.j"
@import "Matchers/OJEql.j"
@import "Matchers/OJEqual.j"

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
+ should:(CPString)specDescription by:(Function)specFn
{
    var currentContext = {};
    for (var prop in this)
        currentContext[prop] = this[prop];

    try
    {
        [Mock resetMockTracking]

        if (currentPreFn) currentPreFn.call(currentContext);
        specFn.call(currentContext);
        if (currentPostFn) currentPostFn.call(currentContext);

        [Mock freezeMockTracking]

        [self ensureMockExpectationsWereMet]

        [Test addSuccess:specDescription]
    }
    catch (obj)
    {
          if (obj == SpecFailedException)
              [Test addFailure:specDescription]
          else
              [Test addFailure:specDescription fromException:obj];
    }
}

+ (void)should:(CPString)specDescription
{
    [Test addResult:@"pending" forSpec:specDescription];
}

/**
 * Verifies that the receivier object matches the expected object. If it,
 * doesn't match it records the test as a failure. Should be run within 
 * the code block of the should:by: method to work correctly.
 */
- (void)should:(id)expected
{
    if(![expected matches:self])
        throw SpecFailedException;
}

/**
 * Verifies that the receivier object doesn’t match the expected object. If it 
 * does match it records the test as a failure. Should be run within the code 
 * block of the should:by: method to work correctly.
 */
- (void)shouldNot(id)expected
{
    if([expected matches:self])
        throw SpecFailedException;
}

+ setCurrentPre:(Function)preFn andPost:(Function)postFn
{
    currentPreFn = preFn;
    currentPostFn = postFn;
}

/**
 * Throws an exception if the expectations of any mocks set up in the beforeEach
 * block are not met.
 */
+ (void)ensureMockExpectationsWereMet
{
    [Mock ensureTrackedExpectationsWereMet]
}

@end
