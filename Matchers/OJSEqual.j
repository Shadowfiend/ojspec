
@import "../OJSMatcher.j"

/**
 * Checks if two objects are the same (has the same identity).
 */
@implementation OJSEqual : OJSMatcher
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
    return [[OJSEqual alloc] initWithExpected:expected];
}
