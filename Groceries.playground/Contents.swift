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
