import UIKit

let numberOfStopLights: Int = 4
var population: Int
population = 5422
let townName: String = "Knowhere"
var townDescription = "\(townName) has a population of \(population) and \(numberOfStopLights) stoplights"
print(townDescription)

/*
Chapter 2 Bronze Challenge p.55
Add a new variable to your playground representing Knowhere’s elevation. Which data type should you use?
Give this variable a value and update townDescription to use this new information.
*/

let townElevation: Int = 2316
townDescription += "And \(townElevation)' elevation."
print(townDescription)
