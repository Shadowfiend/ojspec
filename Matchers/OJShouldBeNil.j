
@import "../OJMatcher.j"

@implementation OJShouldBeNil : OJMatcher
{
}

@end


/**
 * Checks if an object is nil.
 */
@implementation CPObject (ShouldBeNilMatcher)

- (void)shouldBeNil
{
    if(![[[OJShouldBeNil alloc] initWithExpected:nil] matches:self])
        throw SpecFailedException;
}

- (void)shouldNotBeNil
{
    if([[[OJShouldBeNil alloc] initWithExpected:nil] matches:self])
        throw SpecFailedException;
}

@end