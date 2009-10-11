
@import "../OJMatcher.j"


@implementation OJShouldEqual : OJMatcher
{
}

@end

/**
 * Checks if two objects has the same value.
 */
@implementation CPObject (ShouldEqualMatcher)

- (void)shouldEqual:(id)expected
{
    if(![[[OJShouldEqual alloc] initWithExpected:expected] matches:self])
        throw SpecFailedException;
}

- (void)shouldNotEqual:(id)expected
{
    if([[[OJShouldEqual alloc] initWithExpected:expected] matches:self])
        throw SpecFailedException;
}

@end