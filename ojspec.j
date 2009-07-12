@import <Foundation/Foundation.j>
@import "SpecCategory.j"
@import "Test.j"

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
                print(" - should " +result.spec + ": " + result.status);
              });
            }
          }];

});
