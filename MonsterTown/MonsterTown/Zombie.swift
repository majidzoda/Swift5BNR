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
    
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLamp {
            print("This zombie has a bad knee")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLamp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie \(name) is no longer with us.")
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
