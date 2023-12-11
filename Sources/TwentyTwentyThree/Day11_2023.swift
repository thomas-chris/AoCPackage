import Algorithms
import Common
import Foundation
import Regex

public struct Day11 {

    public static func getAnswerPart1(input: [String]) throws -> Int {
        
        solve(input: input, expansion: 1)
        
    }
    
    private static func solve(input: [String], expansion: Int) -> Int {
        var xIndexToExpand = [Int]()
        var yIndexToExpand = [Int]()

        input.enumerated().forEach { (index, row) in
            if row.allSatisfy({ $0 == "."}) {
                yIndexToExpand.append(index)
            }
        }
        
        for j in 0...(input.first!.count - 1) {
            var values = [Character]()
            for string in input {
                values.append(Array(string)[j])
            }
            
            if values.allSatisfy({ $0 == "."}) {
               xIndexToExpand.append(j)
            }
        }
        
        let grid = Grid<String>(input)
        let positions = Array(grid.grid.filter { (key, value) in
            value != "."
        }.keys)
        
        let uniquePairs = positions.allUniquePairs()
        
        return uniquePairs.map { (first, second) in
            let xValues = createArray(from: first.x, to: second.x)
            let yValues = createArray(from: first.y, to: second.y)
            
            let xExpansionCount = xValues.filter { point in
                xIndexToExpand.contains(point)
            }.count
            
            let yExpansionCount = yValues.filter { point in
                yIndexToExpand.contains(point)
            }.count
            
            return first.manhattanDistance(to: second, xExpansion: xExpansionCount * expansion, yExpansion: yExpansionCount * expansion)
        }.reduce(0,+)
    }
    
    public static func getAnswerPart2(input: [String], expansion: Int) throws -> Int {
        
        solve(input: input, expansion: expansion)
    }
}

func createArray(from start: Int, to end: Int) -> [Int] {
    return Array(start <= end ? start...end : end...start)
}

extension Array where Element == String {
    func insertCharacter(at position: Int, newCharacter: Character) -> [String] {
        return map { str in
            var modifiedStr = str
            // Ensure the position is within the bounds of the string
            guard position <= str.count else {
                fatalError("Position \(position) is out of bounds for string '\(str)'")
            }
            // Insert the new character at the specified position
            modifiedStr.insert(newCharacter, at: modifiedStr.index(modifiedStr.startIndex, offsetBy: position))
            return modifiedStr
        }
    }
}

extension Array {
    func allUniquePairs() -> [(Element, Element)] {
        var pairs = [(Element, Element)]()

        for i in 0..<count {
            for j in (i + 1)..<count {
                pairs.append((self[i], self[j]))
            }
        }

        return pairs
    }
}
