
@implementation OJSMatcher : CPObject
{
    id _expected @accessors(property=expected);
    id _actual @accessors(property=actual);
}

- (id)initWithExpected:(id)expected
{
    if(self = [super init])
    {
        _expected = expected;
    }
    
    return self;
}

- (CPString)failureMessageForShould
{
    return @"expected " + [self expected] + " but was " + [self actual];
}

- (CPString)failureMessageCorShouldNot
{
    return @"expected " + [self expected] + " but was " + [self actual];
}

@end
