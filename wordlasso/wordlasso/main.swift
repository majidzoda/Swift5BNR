import Foundation

struct WordLasso {
    func run() throws {
        
        let path = "/usr/share/dict/words"
        let wordFinder = try WordFinder(wordListPath: path, ignoreCase: true)
        
        let args = CommandLine.arguments
        print("Command-line arguments: \(args)")
        
        let template: String
        if args.count > 1 {
            template = args[1]
        } else {
            template = ""
            #warning("Ask the user for input interactively")
        }
        
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
