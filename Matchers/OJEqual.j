
@import "../OJMatcher.j"

/**
 * Checks if two objects are the same (has the same identity).
 */
@implementation OJEqual : OJMatcher
{
}

- (BOOL)matches:(id)actual
{
    [self setActual:actual];
    return ([self expected] === [self actual]);
}

@end

function equal(expected)
{
    return [[OJEqual alloc] initWithExpected:expected];
}
