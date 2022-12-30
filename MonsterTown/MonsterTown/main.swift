import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)

let fredTheZombie: Monster = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()
(fredTheZombie as? Zombie)?.walksWithLamp = true
