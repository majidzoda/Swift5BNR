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

var sportsLeague: Dictionary<String,[String]> = ["Sky Blue FC members" :
                                                            ["Jane",
                                                            "Michaela",
                                                            "Rachel",
                                                            "Allysha",
                                                            "Janine"],
                                                 "Orlando Pride members" :
                                                            ["Sydney",
                                                            "Toni",
                                                            "Shelina",
                                                            "Emily",
                                                            "Chioma"],
                                                 "Houston Dash members" :
                                                            ["Kailen",
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


/*
Chapter10: Dictionaries - Gold Challenge p. 201
Combine your knowledge of dictionaries with some of the previous lessons in this book. Output the members each
team with formatting that looks like this:
    Sky Blue FC members:
    Kailen
    McKenzie
    Thaisa
    Shea
    Jen

    Orlando Pride members:
    Sydney
    Toni
    Shelina
    Emily
    Chioma

    Houston Dash members:
    Jane
    Michaela
    Rachel
    Allysha
    Janine
 
Each team’s members should appear one per line, with no other punctuation. There should be an additional new
line between teams. For added difficulty, make your solution work using only one print() statement (inside a
loop is fine). Writing extremely concise code in this way often harms your ability to read the code later, but
it can be be fun and satisfying to flex your understanding in a playground environment like this.

Some hints: Search the documentation for how to represent special characters in String literals. (For example,
how do you add a tab or new line in a string?) Also, look at the documentation for the print() function. There
are different ways you can call the function to control its output. Lastly, look at the documentation for the
Array type. What are the different ways you can make a single string from an array’s elements?
*/

for (league, players) in sportsLeague {
    print("\t\(league):\n\t\(players.joined(separator: "\n\t"))\n")
}
