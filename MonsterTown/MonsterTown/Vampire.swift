import Foundation

//Chapter15: Struct and Clases - Silver Challenge p 331
class Vampire: Monster {
    var thralls = [Vampire]()
    
    override func terrorizeTown() {
        if town != nil, town!.population >= 1 {
            thralls.append(Vampire())
            town?.changePopulation(by: -1)
        }
        super.terrorizeTown()
    }
}
