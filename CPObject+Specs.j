
@import "OJMatcher.j"

@import "Matchers/OJShouldBeInstanceOf.j"
@import "Matchers/OJShouldBeNil.j"
@import "Matchers/OJShouldBeSameAs.j"
@import "Matchers/OJShouldEqual.j"

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
