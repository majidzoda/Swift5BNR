import UIKit

var myFirstInt: Int = 0

for _ in 1...5 {
    myFirstInt += 1
    print(myFirstInt)
}

for i in 1...100 where i % 3 == 0 {
    print(i)
}

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}
