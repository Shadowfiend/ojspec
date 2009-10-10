
@import "../OJMatcher.j"

/**
 * Checks if an objects is nil.
 */
@implementation OJBeInstanceOf : OJMatcher
{
}

- (BOOL)matches:(id)actual
{
    [self setActual:actual];
    return ([self expected] == [[self actual] class]);
}

@end

function beInstanceOf(expected)
{
    return [[OJBeInstanceOf alloc] initWithExpected:expected];
}
