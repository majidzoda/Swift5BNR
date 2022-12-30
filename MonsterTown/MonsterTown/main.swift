import Foundation

var myTown = Town()
var yourTown = myTown // Now there are two towns!
myTown.changePopulation(by: 500)
print("myTown has \(myTown.population) population and yourTown has \(yourTown.population) population")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

var frederickTheZombie = fredTheZombie // Still only one zombie!
frederickTheZombie.name = "Frederick"
print("Fred's name is \(fredTheZombie.name)")
