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

/**
 * Defines a group of specifications to be run. The group has a name, which may
 * be a string or an actual class.
 *
 * @example
 *  [Test for: MyClass
 *        with: function() {
 *          [MyClass should: "return 5 for reversing"
 *                   by: function() {
 *                     [[[[MyClass alloc] initialize] reverse] shouldEqual: 5]
 *                   }];
 *          [MyClass should: "return 4 for reversing"
 *                   by: function() {
 *                     [[[[MyClass alloc] initialize] reverse] shouldEqual: 4]
 *                   }];
 *        }]
 *
 * @param groupName Can be a string (as in "creating users") or a class (as in
 *   MyClass).
 * @param groupFn A block of code to run that will run the tests for this group.
 */
+ (void)for: (id)groupName with: (Function)groupFn
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

+ addFailure: (CPString)specDescription fromException: (id)exception
{
  [self addResult: 'exception' forSpec: specDescription
        withProperties: { exception: exception }]
}

+ addResult: (CPString)status forSpec: (CPString)specDescription
{
  results[currentGroup].push({ spec: specDescription, status: status });
}

+ addResult: (CPString)status forSpec: (CPString)specDescription
  withProperties: (id)properties
{
  var obj = { spec: specDescription, status: status };
  for (var prop in properties)
    obj[prop] = properties[prop];

  results[currentGroup].push(obj);
}

@end
