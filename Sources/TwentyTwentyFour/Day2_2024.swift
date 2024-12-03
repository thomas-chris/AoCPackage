import Algorithms
import Common
import Regex

public struct Day2 {
    
    enum Direction {
        case increase
        case decrease
    }
    
    public static  func getAnswerPart1(input: [String]) -> Int {
        
        return input
            .map { row in
                row.components(separatedBy: " ").compactMap { Int($0) }
            }
            .map { row in
                rules(row)
            }
            .filter { $0 }
            .count
    }
    
    public static  func getAnswerPart2(input: [String]) -> Int {
        return input
            .map { row in
                row.components(separatedBy: " ").compactMap { Int($0) }
            }
            .map { row in
                (rules(row) || isValid(row))
            }
            .filter { $0 }
            .count
    }
    
    static func rules(_ array: [Int]) -> Bool {
        let diff = zip(array, array.dropFirst()).map { $1 - $0 }
        return diff.allSatisfy { abs($0) >= 1 && abs($0) <= 3 } && (diff.allSatisfy { $0 > 0 } || diff.allSatisfy { $0 < 0 })
    }
    
    static func isValid(_ row: [Int]) -> Bool {
        for i in 0..<row.count {
            var row = row
            row.remove(at: i)
            if rules(row) {
                return true
            }
        }
        return false
    }
}
