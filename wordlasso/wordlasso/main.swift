import Foundation

struct WordLasso {
    func run() throws {
        
        let path = "/usr/share/dict/words"
        let wordFinder = try WordFinder(wordListPath: path, ignoreCase: true)
        let template = "wo.."
        
        let matches = wordFinder.findMatches(for: template)
        print("Found \(matches.count) \(matches.count == 1 ? "match" : "matches")")
        for match in matches {
            print(match)
        }
    }
}

do {
    try WordLasso().run()
} catch {
    fatalError("Program exited unexpectedly. \(error)")
}
