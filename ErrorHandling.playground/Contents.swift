import UIKit

enum Token: CustomStringConvertible {
    case number(Int)
    case plus
    case minus
    
    var description: String {
        switch self {
        case .number(let n):
            return "Number: \(n)"
        case .plus:
            return "Symbol: +"
        case .minus:
            return "Symbol: -"
        }
    }
}

class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character)
    }

    let input: String
    var position: String.Index
    
    init(input: String) {
        self.input = input
        self.position = input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                // Something unexpected - need to send back an error
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek(){
            switch nextCharacter {
            case "0" ... "9":
                // Start of a number - need to grab the rest
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to send back abn error
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error{
        case unexpectedEndOfInput
        case invalidToken(Token)
    }
    var tokens: [Token]
    var position = 0
    
    init(tokens: [Token]){
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
        case .minus:
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            // Getting a plus after number is legal
            case .plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            // Getting a plus after number is legal
            case .minus:
            // After a plus, we must get another number
                let nextNumber = try getNumber()
                value -= nextNumber
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token)
                
            }
        }
        return value
    }
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

evaluate("10 + 3 + 5")
//evaluate("1 + 2 + three")

/*
CHapter23: Error Handling - Bronze Challenge p. 559
Your expression evaluator currently only supports addition.
That is not very useful! Add support for subtraction. You
should be able to call evaluate("10 + 5 - 3 - 1") and see it
output 11.
*/
evaluate("10 + 5 - 3 - 1")
