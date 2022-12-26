import Cocoa

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func isAcending (_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteersSorted = volunteerCounts.sorted(by: isAcending(_:_:))
print(volunteersSorted)
