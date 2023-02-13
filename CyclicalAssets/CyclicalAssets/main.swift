import Foundation

class Simulation {
    func run() {
        let vault13 = Vault(number: 13)
        print("Created \(vault13)")
        
        let coin: Asset = Asset(name: "Rare Coin", value: 1_000.0)
        let gem: Asset = Asset(name: "Big Diamond", value: 5_000.0)
        let poem: Asset = Asset(name: "Magnum Opus", value: 0.0)
        
        vault13.store(coin)
        vault13.store(gem)

        print("Created some assets: \([coin, gem, poem])")
    }
}

let simulation = Simulation()
simulation.run()
dispatchMain()
