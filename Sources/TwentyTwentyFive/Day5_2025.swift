//
//  Day5_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 5, 2025.
//

import Algorithms
import Common
import Regex

public struct Day5 {
    public static func getAnswerPart1(input: String) -> Int {
        let results = parse(input)

        var fresh = Set<Int>()
        results.1.forEach { availableId in
            results.0.forEach { ingridientSet in
                if ingridientSet[0] <= availableId && ingridientSet[1] >= availableId {
                    fresh.insert(availableId)
                }
            }
        }
        return fresh.count
    }

    public static func getAnswerPart2(input: String) -> Int {
        // Your code for part 2
        return 0
    }

    private static func parse(_ input: String) -> ([[Int]], [Int]) {

        var ingridientIds: [[Int]] = []
        var available: [Int] = []

        let split = input.components(separatedBy: "\n\n")
        split[0].components(separatedBy: "\n").forEach { line in
            let ids = line.components(separatedBy: "-")
            ingridientIds.append([ids[0].toInt,ids[1].toInt])
        }

        split[1].components(separatedBy: "\n").forEach { line in
            available.append(String(line).toInt)
        }

        return (ingridientIds, available)

    }
}

extension String {
    var toInt: Int {
        return Int(self.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
    }
}

