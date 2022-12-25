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
