
@import "../OJMatcher.j"

/**
 * Checks if two objects has the same value.
 */
@implementation OJBeNil : OJMatcher
{
}

- (id)initWithExpected:(id)expected
{
    if(self = [super init])
    {
        _expected = nil;
    }
    
    return self;
}

- (BOOL)matches:(id)actual
{
    [self setActual:actual];
    return ([self expected] == [self actual]);
}

@end

function beNil(expected)
{
    return [[OJBeNil alloc] initWithExpected:expected];
}
