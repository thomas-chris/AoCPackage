import Algorithms
import Common
import Foundation
import Regex

public struct Day8 {

    enum Instruction: Int {
        case L = 0
        case R = 1
        
        init(_ string: Character) {
            self = switch string {
            case "L": .L
            case "R": .R
            default: fatalError()
            }
        }
    }
    public static func getAnswerPart1(input: [String]) throws -> Int {
        var input = input
        let instructions = input.removeFirst().map{ Instruction($0) }
        
        let regex = Regex("([A-Za-z1-9]+)")
        let rows = input.reduce(into: [String: [String]]()) { (partialResult, row) in
            let matches = regex.allMatches(in: row).map{ $0.matchedString }
            partialResult[matches.first!] = Array(matches.dropFirst())
        }
        
        let index = getNumberOfSteps(index: 0, position: "AAA", instructions: instructions, rows: rows) { position in
            position != "ZZZ"
        }
        return index
    }
    
    private static func getNumberOfSteps(index: Int, position: String, instructions: [Day8.Instruction], rows: [String: [String]], newPositionCheck: (String) -> Bool) -> Int {
        let count = instructions.count
        let instruction = instructions[index % count]
        let newPosition = rows[position]![instruction.rawValue]
        if newPositionCheck(newPosition) {
            return getNumberOfSteps(index: index + 1, position: newPosition, instructions: instructions, rows: rows, newPositionCheck: newPositionCheck)
        }
        return index + 1
    }
    
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        var input = input
        let instructions = input.removeFirst().map{ Instruction($0) }
        
        let regex = Regex("([A-Za-z1-9]+)")
        let rows = input.reduce(into: [String: [String]]()) { (partialResult, row) in
            let matches = regex.allMatches(in: row).map{ $0.matchedString }
            partialResult[matches.first!] = Array(matches.dropFirst())
        }
        
        let starts = rows.keys.filter { key in
            key.last == "A"
        }

        let results = starts.map { start in
            return getNumberOfSteps(index: 0, position: start, instructions: instructions, rows: rows) { position in
                position.last != "Z"
            }
        }
         
        print(results)
        return findLCM(of: results)
    }
}
