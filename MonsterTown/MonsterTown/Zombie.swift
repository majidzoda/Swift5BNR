import Foundation

class Zombie: Monster {
    var walksWithLamp = true
    
    override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
    }
}
