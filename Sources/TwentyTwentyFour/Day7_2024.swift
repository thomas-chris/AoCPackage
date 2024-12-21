//
//  Day7_2024.swift
//  Created for TwentyTwentyFour
//
//  This file contains the solution for Day 7, 2024.
//

import Algorithms
import Common
import RegexBuilder

public struct Day7 {
    
    nonisolated(unsafe) static let regex = Regex {
        Capture {
            OneOrMore(.digit) // Match one or more digits
        }
        ":"
        ZeroOrMore(.whitespace) // Optional spaces after the colon
        Capture {
            OneOrMore {
                ChoiceOf {
                    OneOrMore(.digit) // Match digits
                    " " // Match spaces
                }
            }
        }
    }
    
    public enum Operators {
        case addition
        case multiply
        case concatenate
        
        func eval(_ a: Int, _ b: Int) -> Int {
            switch self {
            case .addition: return a + b
            case .multiply: return a * b
            case .concatenate:
                var scale = 1
                switch b {
                case 0...9: scale = 10
                case 10...99: scale = 100
                case 100...999: scale = 1000
                default: break
                }
                return a * scale + b  // Int(String(a) + String(b))!
            }
        }
    }
    
    public static func getAnswerPart1(input: [String]) -> Int {
        let operators: [Operators] = [.addition, .multiply]
        let lines = input.compactMap { separateValues($0) }
        return lines.compactMap { line -> Int? in
            if validate(line, operators: operators) {
                return line.0
            } else {
                return nil
            }
        }.reduce(0, +)
    }
    
    public static func getAnswerPart2(input: [String]) -> Int {
        let operators: [Operators] = [.addition, .multiply, .concatenate]
        let lines = input.compactMap { separateValues($0) }
        return lines.compactMap { line -> Int? in
            if validate(line, operators: operators) {
                return line.0
            } else {
                return nil
            }
        }.reduce(0, +)
    }
    
    private static func validate(_ line: (Int, [Int]), operators: [Operators]) -> Bool {
        let total = line.0
        let values = line.1
        var results = [Int]()
        results.append(values.first!)
        
        for next in values[1..<(values.count-1)] {
            var newResults = [Int]()
            for result in results {
                for op in operators {
                    let val = op.eval(result, next)
                    if val <= total {
                        newResults.append(val)
                    }
                }
            }
            results = newResults
        }
        
        let next = values.last!
        for result in results {
            for op in operators {
                if op.eval(result, next) == total {
                    return true
                }
            }
        }
        
        return false
    }
    
    private static func separateValues(_ line: String) -> (Int, [Int])? {
        if let match = line.firstMatch(of: regex) {
            let key = Int(match.output.1)!
            let values = match.output.2
                .split(whereSeparator: { !$0.isWholeNumber }) // Remove non-digit characters
                .compactMap { Int($0) } // Convert to integers
            
            return (key, values)
        }
        
        return nil
    }
}
