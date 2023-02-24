import Foundation
import ArgumentParser

struct WordLasso: ParsableCommand {
    @Argument(help: """
        The calcualtion input to compute. Leaving this blank will enter interactive mode.
    """)
    var calc: String?

    
    func run() throws {
        let args = CommandLine.arguments
        print("Command-line arguments: \(args)")

        if let calc = calc {
            let calc = args[1]
            evaluate(calc)
        } else {
            while true {
                print("Enter calculation: ", terminator: "")
                let calc = readLine() ?? ""
                if calc.isEmpty { return }
                evaluate(calc)
            }

        }
    }
}

func evaluate(_ input: String)  {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
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
