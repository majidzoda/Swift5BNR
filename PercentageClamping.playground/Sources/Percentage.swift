import Foundation

@propertyWrapper public struct Percentge {
    private var storage: Double
    
    public init (wrappedValue: Double){
        storage = max(min(wrappedValue, 1), 0)
    }
    
    public var wrappedValue: Double {
        set {
            storage = max(min(newValue, 1), 0)
        }
        get {
            return storage
        }
    }
}
