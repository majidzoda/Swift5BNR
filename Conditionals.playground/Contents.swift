import UIKit

let population: Int = 100000
let message: String
let hasPostOffice: Bool = true

/*
Chapter 3 Bronze Challenge p.69
Add an additional else if statement to the town-sizing code to see if your town’s population is very
large. Choose your own population thresholds. Set the message variable accordingly.
*/
if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000{
        message = "\(population) is a medium town!"
} else if population >= 50000 && population < 100000{
        message = "\(population) is a medium big!"
} else {
    message = "\(population) is very large!"
}
print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}
