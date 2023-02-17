import Foundation

@propertyWrapper public struct Percentge {
    private var storage: Double
    private var upperBound: Double
    
    public init (wrappedValue: Double, upperBound: Double = 1){
        storage = max(min(wrappedValue, 1), 0)
        self.upperBound = upperBound
    }
    
    public var wrappedValue: Double {
        set {
            storage = max(min(newValue, upperBound), 0)
        }
        get {
            return storage
        }
    }
}
