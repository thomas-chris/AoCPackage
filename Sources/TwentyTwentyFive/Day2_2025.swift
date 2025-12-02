//
//  Day2_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 2, 2025.
//

import Algorithms
import Foundation
import Common
import Regex

public struct Day2 {
    public static func getAnswerPart1(input: String) -> Int {
        var numbersToAdd = [Int]()
        input
            .components(separatedBy: ",")
            .map { line in
                let range = line.components(separatedBy: "-")
                return (range[0], range[1])
            }
            .forEach { range in
                for i in Int(range.0)!...Int(range.1)! {
                    let str = String(i)
                    if str.splitStringInHalfAndCheckIfEqual() {
                        numbersToAdd.append(i)
                    }
                }
            }

        return numbersToAdd.reduce(0, +)
    }

    public static func getAnswerPart2(input: String) -> Int {
        // Your code for part 2
        return 0
    }

    public static func findRepetition(_ s: String) -> String? {
        if s.isEmpty { return nil }
        let pattern = "([a-z]+)\\1+"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        if let match = regex?.firstMatch(in: s, options: [], range: NSRange(location: 0, length: s.utf16.count)) {
            let unitRange = match.range(at: 1)
            return (s as NSString).substring(with: unitRange)
        }
        return nil
    }
}

extension String {
    func splitStringInHalfAndCheckIfEqual() -> Bool {
        guard self.count % 2 == 0 else { return false }
        let halfLength = self.count / 2
        let prefix = self.prefix(halfLength)
        let suffix = self.suffix(halfLength)
        return prefix == suffix
    }
}
