
@import "../OJSMatcher.j"

/**
 * Checks if two objects has the same value.
 */
@implementation OJSEql : OJSMatcher
{
}

- (BOOL)matches:(id)actual
{
    [self setActual:actual];
    return ([self expected] == [self actual]);
}

@end

function eql(expected)
{
    return [[OJSEql alloc] initWithExpected:expected];
}
