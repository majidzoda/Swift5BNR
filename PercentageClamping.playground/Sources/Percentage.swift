import Foundation

@propertyWrapper public struct Percentge<Value: BinaryFloatingPoint> {
    private var storage: Value
    private var upperBound: Value
    
    public init (wrappedValue: Value, upperBound: Value = 1){
//        storage = max(min(wrappedValue, 1), 0)
        storage = wrappedValue
        self.upperBound = upperBound
    }
    
    public var wrappedValue: Value {
        set {
//            storage = max(min(newValue, upperBound), 0)
            storage = newValue
        }
        get {
//            return storage
//            return max(min(storage, upperBound), 0)
            return clamped(to: 0...1)
        }
    }
    
    private func clamped(to range: ClosedRange<Value>) -> Value {
        return max(min(storage, range.upperBound), range.lowerBound)
    }
    
    public var projectedValue: Value {
        get {
            return storage
        }
    }
}
