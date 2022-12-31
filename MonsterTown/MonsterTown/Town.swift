import Foundation

struct Town {
    var mayor: Mayor?
    static let world = "Earth"
    let region = "Middle"
    var population = 5_422 {
        didSet (oldPopulation) {
            if population < oldPopulation{
                //        Chapter16: Properties Bronze Challenge p. 359
                print("Mayor: The population has changed to \(population) from \(oldPopulation).")
                //        Chapter16: Properties Silver Challenge p. 360
                mayor?.makeAStatement()
            }
        }
    }
    var numberOfStopLights = 4
    
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
