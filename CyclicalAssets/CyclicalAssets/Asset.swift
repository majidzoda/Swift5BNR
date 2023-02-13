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
    var changeHandler: ValueChangeHandler = { _ in }

    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }

    deinit {
        print("\(self) is being deallocated")
    }
}

extension Asset: CustomStringConvertible {
    var description: String {
        if let container = container {
            return "Asset(\(name), worth \(value), in \(container))"
        } else {
            return "Asset(\(name), worth \(value), not stored anywhere)"
        }
    }
}
