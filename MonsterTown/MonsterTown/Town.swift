import Foundation

struct Town {
    var population = 5_422
    var numberOfStopLights = 4
    
    func printDescription () {
        print("Population: \(population); number of stopLights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation (by amount: Int) {
        // population += amount
        
        // Chapter15: Struct and Clases - Bronze Challenge p. 330
        population = population + amount < 0 ? 0 : population + amount
    }
}
