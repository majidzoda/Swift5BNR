import UIKit

var moveiRatings = ["Tron" : 4, "WarGames" : 5, "Sneakers" : 4]
moveiRatings.count
let tronRating = moveiRatings["Tron"]

moveiRatings["Sneakers"] = 5
moveiRatings
let oldRating: Int? = moveiRatings.updateValue(5, forKey: "Tron")
if let lastRating = oldRating, let currentRating = moveiRatings["Tron"] {
    print("old rating: \(lastRating)")
    print("current rating: \(currentRating)")
}

moveiRatings["Hackers"] = 5
//moveiRatings.removeValue(forKey: "Sneakers")
moveiRatings["Sneakers"] = nil

for (key, value) in moveiRatings {
    print("The movie \(key) was rated \(value).")
}
for movi in moveiRatings.keys {
    print("User has rated \(movi).")
}

let watchedMOvies = Array(moveiRatings.keys)

/*
Chapter 10: Silver Challenge p. 200
It is not uncommon to place instances of the Array type inside a dictionary. Create a
dictionary that represents a league of sports teams. Each dictionary key will be the name of an individual
team (three teams is enough), and each value will be an array of the names of five players on that team. (You
can make up the team and player names.)

Nesting data structures like this allows you to organize hierarchical data within a single object.
 
In the console, log only the dictionary’s player names. Your result should look something like the output
below. (We have formatted the array so that the names fit on the page. Your array of names may appear in a
single long line.)
 
 The NWSL has the following players: ["Jane", "Michaela", "Rachel", "Allysha",
        "Janine", "Sydney", "Toni", "Shelina", "Emily", "Chioma", "Kailen",
        "McKenzie", "Thaisa", "Shea", "Jen"]
*/

var sportsLeague: Dictionary<String,[String]> = ["Alpha" : ["Jane",
                                                            "Michaela",
                                                            "Rachel",
                                                            "Allysha",
                                                            "Janine"],
                                                 "Betta" : ["Sydney",
                                                            "Toni",
                                                            "Shelina",
                                                            "Emily",
                                                            "Chioma"],
                                                 "Gamma" : ["Kailen",
                                                            "McKenzie",
                                                            "Thaisa",
                                                            "Shea",
                                                            "Jen"]
]

var printArray: [String] = []
for values in sportsLeague.values{
    printArray += values
}

print(" The NWSL has the following players: \(printArray)")

