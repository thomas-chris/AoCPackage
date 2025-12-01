import Algorithms
import Common
@preconcurrency import Regex

public actor Day3 {
    
    static let part1Regex = Regex(#"mul\((\d{1,3}),(\d{1,3})\)"#)
    static let part2Regex = Regex(#"(?:(don't\(\))|(do\(\)))|mul\((\d{1,3}),(\d{1,3})\)"#)
    
    public static  func getAnswerPart1(input: [String]) -> Int {
        
        input
            .map { row in
                part1Regex.allMatches(in: row)
                .map { result in
                    (Int(result.captures[0]!) ?? 0) * (Int(result.captures[1]!) ?? 0)
                }
                .reduce(0, +)
            }
            .reduce(0,+)
    }
    
    public static  func getAnswerPart2(input: [String]) -> Int {
        // State variables
        var enabled = true // Assume enabled initially
        var results: [(Int, Int)] = [] // Store valid `mul(x, y)` numbers
        input.forEach { input in
            
            for match in part2Regex.allMatches(in: input) {
                if let _ = match.captures[0] { // Matches "don't()"
                    enabled = false
                } else if let _ = match.captures[1] { // Matches "do()"
                    enabled = true
                } else if enabled, let x = match.captures[2], let y = match.captures[3],
                          let xInt = Int(x), let yInt = Int(y) { // Matches "mul(x, y)"
                    results.append((xInt, yInt))
                }
            }
            
        }
        return results.reduce(into: 0) { partialResult, values in
            partialResult += values.0 * values.1
        }
    }
}
