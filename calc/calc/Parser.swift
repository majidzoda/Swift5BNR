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
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token)
                
            }
        }
        return value
    }
}
