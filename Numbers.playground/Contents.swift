import UIKit

var greeting = "Hello, playground"

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")
print("The maximum value for a 32-bit integer is \(Int32.max).")
print("The minimum value for a 32-bit integer is \(Int32.min).")

print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")
print("The maximum value for a 32-bit unsigned integer is \(UInt32.max).")
print("The minimum value for a 32-bit unsigned integer is \(UInt32.min).")

let numbersOfPage: Int = 10
let numberOfChapters = 3

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

10 + 20
30 - 5
5 * 6

10 + 2 * 5
30 - 5 - 5
(10 + 2) * 5
30 - (5 - 5)

11 / 3
11 % 3
-11 % 3

var x = 10
x += 10
x -= 5

let y: Int8 = 120
let z = y &+ 10

let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b)
