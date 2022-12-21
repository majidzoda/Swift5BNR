import UIKit

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"
let quote = #"I wanted to \"say\":\n\(playground)"#
print(quote)

for c: Character in mutablePlayground {
    print("'\(c)'")
}
