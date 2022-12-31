import Foundation

struct Town {
    let region = "Middle"
    var population = 5_422
    var numberOfStopLights = 4
    
    func printDescription () {
        print("Population: \(population); number of stopLights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation (by amount: Int) {
        population += amount
    }
}
