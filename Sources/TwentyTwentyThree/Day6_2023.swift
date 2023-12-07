import Algorithms
import Common
import Foundation
import Regex

public struct Day6 {
    
    public static func getAnswerPart1(input: [String]) throws -> Int {
        let numbersRegex = try Regex(string: "\\d+")
        let numbers = input.compactMap { row in
            numbersRegex.allMatches(in: row).compactMap { Int($0.matchedString) }
        }
        
        let zippedNumbers = Array(zip(numbers[0], numbers[1]))
        
        let results = zippedNumbers.map { (time, distance) in
            var distances: [Int] = []
            for i in 0...time {
                let travelledDistance = (time - i) * (i)
                if travelledDistance > distance {
                    distances.append(travelledDistance)
                }
            }
            return distances.count
        }
        
        return results.reduce(1, *)
    }
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        let numbersRegex = try Regex(string: "\\d+")
        let numbers = input.compactMap { row in
            let value = numbersRegex.allMatches(in: row).map { $0.matchedString }.reduce("", +)
            return Int(value)
        }
        
        let time = numbers[0]
        let distance = numbers[1]
        
        var distances: [Int] = []
        for i in 0...time {
            let travelledDistance = (time - i) * (i)
            if travelledDistance > distance {
                distances.append(travelledDistance)
            }
        }
        
        return distances.count
    }
}


