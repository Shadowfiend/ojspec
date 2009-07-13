@import <Foundation/Foundation.j>
@import "SpecCategory.j"
@import "Test.j"
@import "Formatting.j"

args.forEach(function(file) {
  [Test resetSpecs];
  var results =
    [Test runSpecsOn: file
          whenDone: function(results) {
            for (var category in results)
            {
              var catResults = results[category];
              print(category);
              catResults.forEach(function(result) {
                if (result.status == "success")
                  print(green(" - should " + result.spec));
                else if (result.status == "failure")
                  print(red(" - should " + result.spec + " - FAILURE"));
                else if (result.status == "exception")
                {
                  print(blue(" - should " + result.spec + " - EXCEPTION"));

                  var exc = result.exception;
                  if (exc.isa)
                    print(blue("   " + exc.name + " " + exc.reason));
                  else
                  {
                    print(blue("   " + exc.name + " - " + message));
                    print(exc.stack);
                  }
                }
              });
            }
          }];

});
