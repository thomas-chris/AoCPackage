import Algorithms
import Common
import Regex

public struct Day2 {
    typealias GreenRedBlue = (Int, Int, Int)
    
    public static  func getAnswerPart1(input: [String]) throws -> Int {
        
        let games = try games(input)
        let totalGreen = 13
        let totalRed = 12
        let totalBlue = 14
        let validGames = games.compactMap { (key: Int, value: [GreenRedBlue]) -> Int? in
            let validGames = value.map { greenRedBlue in
                greenRedBlue.0 <= totalGreen && greenRedBlue.1 <= totalRed && greenRedBlue.2 <= totalBlue
            }
            
            if validGames.allSatisfy({ $0 }) {
                return key
            }
            
            return nil
        }
        
        return validGames.reduce(0, +)
    }
    
    public static  func getAnswerPart2(input: [String]) throws -> Int {
        
        let games = try games(input)
        let power = games.map { (key: Int, value: [GreenRedBlue]) in
            var largestGreen = 0
            var largestRed = 0
            var largestBlue = 0
            
            value.forEach { greenRedBlue in
                largestGreen = max(largestGreen, greenRedBlue.0)
                largestRed = max(largestRed, greenRedBlue.1)
                largestBlue = max(largestBlue, greenRedBlue.2)
            }
            
            return largestRed * largestBlue * largestGreen
        }
        return power.reduce(0, +)
    }
    
    private static func games(_ input: [String]) throws -> [Int: [GreenRedBlue]] {
        
        let regex = try Regex(string: "\\s*([^;:]+)\\s*[:,;]?\\s*")
        let values = try input.dropLast().map { row in
            let sections = regex.allMatches(in: row).map { $0.matchedString }
            
            
            let greenRegex = try Regex(string: "\\d+ green")
            let redRegex = try Regex(string: "\\d+ red")
            let blueRegex = try Regex(string: "\\d+ blue")
            let game = try extractNumber(sections.first!)
            let results = try sections.dropFirst().compactMap { game -> GreenRedBlue in
                let greenValue = greenRegex.firstMatch(in: game)?.matchedString
                let redValue = redRegex.firstMatch(in: game)?.matchedString
                let blueValue = blueRegex.firstMatch(in: game)?.matchedString
                
                let green = try extractNumber(greenValue ?? "0")
                let red = try extractNumber(redValue ?? "0")
                let blue = try extractNumber(blueValue ?? "0")
                
                return (green, red, blue)
            }
            
            return (game, results)
        }
        
        var result = [Int: [GreenRedBlue]]()
        for value in values {
            result[value.0] = value.1
        }
        return result
    }
    
    private static func extractNumber(_ string: String) throws -> Int {
        let numberRegex = try Regex(string:  "\\d+")
        guard let value = numberRegex.firstMatch(in: string)?.matchedString else { return 0 }
        return Int(value) ?? 0
    }
}
