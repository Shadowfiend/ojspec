
@import "../OJMatcher.j"

/**
 * Checks if two objects has the same value.
 */
@implementation OJEql : OJMatcher
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
    return [[OJEql alloc] initWithExpected:expected];
}
