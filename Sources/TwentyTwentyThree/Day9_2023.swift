import Algorithms
import Common
import Foundation
import Regex

public struct Day9 {

    public static func getAnswerPart1(input: [String]) throws -> Int {
        
        let regex = Regex("[-+]?\\d+(\\.\\d+)?")
        return input.map { row in
            let values = regex
                .allMatches(in: row)
                .map { $0.matchedString }
                .compactMap { Int($0) }
            return computeNextValue(lastValues: [values.last!], row: values)
        }
        .reduce(0, +)
    }
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        let regex = Regex("[-+]?\\d+(\\.\\d+)?")
        return input.map { row in
            let values = Array(regex
                .allMatches(in: row)
                .map { $0.matchedString }
                .compactMap { Int($0) }
                .reversed()
                )
            return computeNextValue(lastValues: [values.last!], row: values)
        }
        .reduce(0, +)
    }
    
    private static func computeNextValue(lastValues: [Int], row: [Int]) -> Int {
        var lastValues = lastValues
        let differences = findDifferences(row)
        if differences.allSatisfy({ $0 == 0 }) {
            return lastValues.reduce(0,+)
        }
        
        lastValues.append(differences.last!)        
        return computeNextValue(lastValues: lastValues, row: differences)
    }
    
    private static func findDifferences(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return []
        }

        var differences = [Int]()

        for i in 1..<array.count {
            let difference = array[i] - array[i - 1]
            differences.append(difference)
        }

        return differences
    }
}
