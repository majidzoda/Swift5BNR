import Cocoa

//var groceryList = Set<String>(["Apples", "Oranges"])
var groceryList: Set = ["Apples", "Oranges"]
groceryList.insert("Kiwi")
groceryList.insert("Pears")

for food in groceryList {
    print(food)
}

groceryList.remove("Pears")
let hasBananas = groceryList.contains("Bananas")

let friendsGroceryList = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let sharedList = groceryList.union(friendsGroceryList)

let duplicateItems = groceryList.intersection(friendsGroceryList)

let disjoint = groceryList.isDisjoint(with: friendsGroceryList)

let players = ["Anna", "Vijay", "Jenka"]
let winners = ["Jenka", "Jenka", "Vijay", "Jenka"]

let playerSet = Set(players)
let winnerSet = Set(winners)
playerSet.subtracting(winnerSet)

/*
Chapter11: Sets - Bronze Challenge p. 216
Consider the following code that models the cities two people have visited as sets.

let myCities: Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "Denver"]
let yourCities: Set = ["Chicago", "Denver", "Jacksonville"]
 
Find a method on Set that returns a Bool indicating whether myCities contains all the
cities contained by yourCities. (Hint: This relationship would make myCities a superset of
yourCities.)
*/

let myCities: Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "Denver"]
let yourCities: Set = ["Chicago", "Denver", "Jacksonville"]
myCities.isSuperset(of: yourCities)

