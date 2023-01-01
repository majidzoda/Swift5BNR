import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLamp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLamp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    func regenerate() {
        walksWithLamp = false
    }
    
    override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
        regenerate()
    }
}
