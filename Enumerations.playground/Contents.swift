import Cocoa

enum TextAlignment {
    case left
    case right
    case center
    case justify
}

var alignemt = TextAlignment.justify

//if alignemt == .right {
//    print("We should right-align the text")
//}

switch alignemt {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:
    print("center aligned")
case .justify:
    print("justified")
}
