import Foundation

struct Town {
    static let world = "Earth"
    let region: String
    var population: Int {
        didSet (oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    var numberOfStopLights: Int
    
    init(region: String, population: Int, stopLights: Int) {
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    }
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        switch population {
        case 0...10_000:
            return Size.small
        case 10_001...100_000:
            return Size.medium
        default:
            return Size.large
        }
    }
    
    func printDescription () {
        print("Population: \(population); number of stopLights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation (by amount: Int) {
        population += amount
    }
}
