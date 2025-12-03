//
//  Day3_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 3, 2025.
//

import Algorithms
import Common
import Regex

public struct Day3 {
    public static func getAnswerPart1(input: [String]) -> Int {
        var jolts = [Int]()
        input.forEach { line in
            var currentMax = 0
            line.prefix(line.count - 1).forEach { char in
                if Int(char)! > currentMax {
                    currentMax = Int(char)!
                }
            }

            var nextMax = 0
            let indexOfCurrentMax = line.firstIndex(of: Character(String(currentMax)))!
            line
                .suffix(from: indexOfCurrentMax)
                .dropFirst()
                .forEach { char in
                    if Int(char)! > nextMax {
                        nextMax = Int(char)!
                }
            }
            jolts.append(Int("\(currentMax)\(nextMax)")!)
        }

        return jolts.reduce(0, +)
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        var jolts = [String]()
        var length = 12

        input.forEach { line in
            var jolt = ""
            var line = line
            while length != 0 {
                let result = manipulateInput(line, prefix: length)
                line = result.output
                jolt += result.joltValue
                length -= 1
            }
            jolts.append(jolt)
            length = 12
        }

        return jolts
                .compactMap { Int($0) }
                .reduce(0, +)
    }

    private static func manipulateInput(_ line: String, prefix: Int) -> (output : String, joltValue: String) {
        var currentMax = 0

        line.prefix(line.count - (prefix - 1)).forEach { char in
            if Int(char)! > currentMax {
                currentMax = Int(char)!
            }
        }

        let indexOfCurrentMax = line.firstIndex(of: Character(String(currentMax)))!
        let prefix = String(line.prefix(upTo: indexOfCurrentMax) + String(currentMax))
        let newLine = line.replacingFirstOccurrence(of: prefix, with: "")
        return (newLine, String(currentMax))
    }

}

extension String {
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
