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
        // Your code for part 2
        return 0
    }
}
