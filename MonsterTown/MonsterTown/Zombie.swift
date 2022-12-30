import Foundation

class Zombie: Monster {
    var walksWithLamp = true
    
    func regenerate() {
        walksWithLamp = false
    }
    
    override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
        regenerate()
    }
}
