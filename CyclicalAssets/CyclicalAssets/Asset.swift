import Foundation

class Asset {
    let name: String
    var value: Double {
        didSet {
            changeHandler(value - oldValue)
        }
    }
    weak var container: Vault?
    
    typealias ValueChangeHandler = (Double) -> Void
    var changeHandler: ValueChangeHandler

    init(name: String, value: Double, changeHandler: @escaping ValueChangeHandler = { _ in }) {
        self.name = name
        self.value = value
        self.changeHandler = changeHandler
    }

    deinit {
        print("\(self) is being deallocated")
    }
}

extension Asset: CustomStringConvertible, Equatable {
    static func == (lhs: Asset, rhs: Asset) -> Bool {
        return lhs.value == rhs.value && lhs.name == rhs.name  
    }
    
    var description: String {
        if let container = container {
            return "Asset(\(name), worth \(value), in \(container))"
        } else {
            return "Asset(\(name), worth \(value), not stored anywhere)"
        }
    }
}
