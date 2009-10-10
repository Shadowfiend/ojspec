
@import "../OJMatcher.j"

/**
 * Checks if an objects is nil.
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

@end

function beNil(expected)
{
    return [[OJBeNil alloc] initWithExpected:expected];
}
