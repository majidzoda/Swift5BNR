import UIKit

//var bucketList: Array<String>
//var bucketList: [String]
//var bucketList: [String] = ["Climb Mt. Everest"]
var bucketList = ["Climb Mt. Everest"]
bucketList.append("Read War and Peace")
bucketList.append("Go on a arctic expedition")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.append("Find a triple rainbow")
bucketList.count
bucketList.remove(at: 1)
bucketList
print(bucketList[...2])
bucketList[1] += " with friends"
bucketList[1]
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList
bucketList.insert("Toboggan across Alasaka", at: 1)
bucketList

var newItems = ["Bike across America",
                "Make a perfect souffle",
                "Solve Fermat's enigma"
]

//for item in newItems {
//    bucketList.append(item)
//}
bucketList += newItems
print(bucketList)

var anotherList = ["Bike across America",
                   "Make a perfect souffle",
                   "Solve Fermat's enigma"
]

newItems == anotherList
