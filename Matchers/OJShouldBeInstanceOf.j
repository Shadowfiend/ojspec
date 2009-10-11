
@import "../OJMatcher.j"


@implementation OJShouldBeInstanceOf : OJMatcher
{
}

- (BOOL)matches:(id)actual
{
    return [super matches:[[self actual] class]];
}

@end


/**
 * Checks if an object is an instance of the expected class
 */
@implementation CPObject (ShouldBeInstanceOfMatcher)

- (void)shouldBeInstanceOf:(Class)expected
{
    if(![[[OJShouldBeInstanceOf alloc] initWithExpected:expected] matches:self])
        throw SpecFailedException;
}

- (void)shouldNotBeInstanceOf:(Class)expected
{
    if([[[OJShouldBeInstanceOf alloc] initWithExpected:expected] matches:self])
        throw SpecFailedException;
}

@end
