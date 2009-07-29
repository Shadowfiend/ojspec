@import <Foundation/Foundation.j>
@import "SpecCategory.j"
@import "Test.j"
@import "Mock.j"
@import "Formatting.j"

args.forEach(function(file) {
  [Test resetSpecs];
  var results =
    [Test runSpecsOn: file
          whenDone: function(results) {
            var total = 0;
            var failures = 0;
            var exceptions = 0;

            for (var category in results)
            {
              var catResults = results[category];
              print(category);
              catResults.forEach(function(result) {
                total++
                if (result.status == "success")
                  print(green(" - should " + result.spec));
                else if (result.status == "failure")
                {
                  print(red(" - should " + result.spec + " - FAILURE"));
                  failures++;
                }
                else if (result.status == "exception")
                {
                  print(blue(" - should " + result.spec + " - EXCEPTION"));

                  var exc = result.exception;
                  if (exc.isa)
                    print(blue("   " + exc.name + ": " + exc.reason));
                  else
                  {
                    print(blue("   " + exc.name + ": " + exc.message));
                    print(exc.stack);
                  }
                  exceptions++;
                }
              });

              var errs = failures + exceptions;
              var output = total;
              output += " example" + (total > 1 ? "s, " : ", ");
              output += errs + " failure" + (errs > 1 ? "s" : '');
              if (exceptions == 1)
                output += ", " + exceptions + " due to an exception.";
              else if (exceptions > 0)
                output += ", " + exceptions + " due to exceptions.";
              else
                output += ".";

              if (failures + exceptions > 0)
                output = red(output);
              else
                output = green(output);

              print("\n" + output);
            }
          }];

});
