import Foundation
import ArgumentParser

struct WordLasso: ParsableCommand {
//    @Argument(help: """
//        The word template to match, with \(WordFinder.wildcard) as
//        placeholders. Leaving this blank will enter interactive mode.
//    """)
//    var template: String?
//
//    @Flag(name: .shortAndLong, help: "Perform case-insensitive matches.")
//    var ignoreCase: Bool = false
//
//    @Option(name: .customLong("wordfile"),
//            help: "Path to a newline-delimited word list.")
//    var wordListPath: String = "/usr/share/dict/words"
//
//    @Option(name: .shortAndLong,
//            help: "Returning number of matches.")
//    var countMatch: Int?
    
    func run() throws {
        
//        let wordFinder = try WordFinder(wordListPath: wordListPath, ignoreCase: ignoreCase)
//
//        let args = CommandLine.arguments
//        print("Command-line arguments: \(args)")
//
//        if let template = template {
//            let template = args[1]
//            findAndPrintMatches(for: template, using: wordFinder)
//        } else {
//            while true {
//                print("Enter word template: ", terminator: "")
//                let template = readLine() ?? ""
//                if template.isEmpty { return }
//                findAndPrintMatches(for: template, using: wordFinder)
//            }
//
//        }
        
        evaluate("10 + 3 + 5")
//        evaluate("1 + 2 + three")
        

    }
    
//    private func findAndPrintMatches (for template: String, using wordFinder: WordFinder) {
//        let matches = wordFinder.findMatches(for: template)
//        print("Found \(matches.count) \(matches.count == 1 ? "match" : "matches")\(countMatch == nil ? ":" : "; listing the first \(countMatch!):")")
//
//        for i in stride(from: 0, to: countMatch ?? matches.count, by: 1) {
//            print(matches[i])
//        }
//    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try! lexer.lex()
        print("Lexer output: \(tokens)")
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let character){
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexpectedEndOfInput{
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token){
        print("Invalid token during parsing: \(token)")
    }
    
    catch {
        print("An error occured: \(error)")
    }
    
}



WordLasso.main()
