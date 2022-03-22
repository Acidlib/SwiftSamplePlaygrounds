import UIKit

var dictionary = ["a": 1, "b": 2]

// Keeping existing value for key "a":
dictionary.merge(["a": 3, "c": 4]) { (current, _) in current }
// ["b": 2, "a": 1, "c": 4]

// Taking the new value for key "a":
dictionary.merge(["a": 5, "d": 6]) { (_, new) in new }
print(dictionary)
// ["b": 2, "a": 5, "c": 4, "d": 6]


dictionary = ["a": 1, "b": 2]
var otherDictionary = ["a": 3, "b": 4, "d": 5]

let keepingCurrent = dictionary.merging(otherDictionary)
      { (current, _) in current }
print(keepingCurrent)
// ["a": 1, "d": 5, "b": 2]
let replacingCurrent = dictionary.merging(otherDictionary)
      { (_, new) in new }
print(replacingCurrent)
// ["b": 2, "a": 1, "d": 5]



