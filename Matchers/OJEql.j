
@import "../OJMatcher.j"

/**
 * Checks if two objects has the same value.
 */
@implementation OJEql : OJMatcher
{
}

@end

function eql(expected)
{
    return [[OJEql alloc] initWithExpected:expected];
}
