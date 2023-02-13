import Foundation

class Vault {
    let number: Int
    private(set) var assets = [Asset]()
    
    var totalValue: Double {
        var total: Double = 0
        assets.forEach { (each) in
            total += each.value
        }
        return total
    }

    init(number: Int) {
        self.number = number
    }

    deinit {
        print("\(self) is being deallocated")
    }
    
    func store(_ asset: Asset) {
        asset.container = self
        asset.changeHandler = { [weak self](change) in
            print("An asset has changed value by \(change). New total value: \(String(describing: self?.totalValue))")}
        assets.append(asset)
    }
    
    func remove(_ asset: Asset){
        guard let index = assets.firstIndex(where: { $0 == asset}) else {
            print("Can't find asset's index in assets")
            return
        }
        assets.remove(at: index)
        asset.container = nil
    }
}

extension Vault: CustomStringConvertible {
    var description: String {
        return "Vault(\(number))"
    }
}
