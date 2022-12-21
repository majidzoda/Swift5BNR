import UIKit

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"
let quote = #"I wanted to \"say\":\n\(playground)"#
print(quote)

for c: Character in mutablePlayground {
    print("'\(c)'")
}

let snowman = "\u{2603}"
let aAcute = "\u{0061}\u{0301}"
for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed)

aAcute.count
aAcutePrecomposed.count

let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]

let range = ...end
let firstFive = playground[range]

/*
Cbapter7: Bronze Challenge p.140
Create a new String instance called empty and give it an empty string (a string with no
characters): let empty = "". It is useful to be able to tell if a string has any characters in it. For example,
you may be designing a form for data input and want to prevent the user from submitting a blank entry. Use the
startIndex and endIndex properties on empty to determine whether this string is truly empty.
*/

let empty = ""
empty.startIndex == empty.endIndex
empty.count



