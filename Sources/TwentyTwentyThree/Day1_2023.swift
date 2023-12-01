import Algorithms
import Common
import Regex

public struct Day1 {
    public static  func getAnswerPart1(input: [String]) -> Int {
        
        input.compactMap { row -> Int? in
            let first = row.first { character in
                Int(character) != nil
            }
            let last = row.reversed().first { character in
                Int(character) != nil
            }
            
            guard 
                let first, let last
            else
            {
                return nil
            }
                  
            
            return Int(String(first) + String(last))
        }.reduce(0, +)
    }
    
    enum Number: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        
        init(_ string: String) {
            switch string {
            case "one": self = .one
            case "two": self = .two
            case "three": self = .three
            case "four": self = .four
            case "five": self = .five
            case "six": self = .six
            case "seven": self = .seven
            case "eight": self = .eight
            case "nine": self = .nine
            default: fatalError()
            }
        }
    }
    
    public static  func getAnswerPart2(input: [String]) -> Int {
    
        let regex = Regex("(one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9)")
        let reveresed = Regex("(eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|1|2|3|4|5|6|7|8|9)")
        return input.compactMap { row -> Int? in
            
            guard let match = regex.firstMatch(in: row)?.matchedString,
                  let lastMatchCollection = reveresed.firstMatch(in: String(row.reversed()))?.matchedString.reversed() else
            { return nil }
            
            let lastMatch = String(lastMatchCollection)
            
            if match.count == 1 {
                if lastMatch.count == 1 {
                    return Int(match + lastMatch)
                }
                
                return Int(match + Number(lastMatch).rawValue)
            } else {
                    if lastMatch.count == 1 {
                        return Int(Number(match).rawValue + lastMatch)
                    }
                return Int(Number(match).rawValue + Number(lastMatch).rawValue)
            }
        }.reduce(0, +)
    }
}
