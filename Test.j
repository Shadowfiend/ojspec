var results;
var tests;
var currentGroup;

@implementation Test : CPObject
{
}

+ (void)resetSpecs
{
  results = {};
  tests = {};
}

+ (CPArray)runSpecsOn: (CPString)fileName whenDone: (Function)resultHandler
{
  objj_import(fileName, true, function()
    {
      resultHandler(results);
    });
}

+ (void)for: (CPString)groupName with: (Function)groupFn
{
  currentGroup = groupName;
  results[currentGroup] = [];

  groupFn();
}

+ addSuccess: (CPString)specDescription
{
  [self addResult: 'success' forSpec: specDescription];
}

+ addFailure: (CPString)specDescription
{
  [self addResult: 'failure' forSpec: specDescription];
}

+ addResult: (CPString)status forSpec: (CPString)specDescription
{
  results[currentGroup].push({ spec: specDescription, status: status });
}

@end
