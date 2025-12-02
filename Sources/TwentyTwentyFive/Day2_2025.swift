//
//  Day2_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 2, 2025.
//

import Algorithms
import Common
@preconcurrency import Regex

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

    public static func getAnswerPart1b(input: String) -> Int {

        input
            .components(separatedBy: ",")
            .map { line in
                let range = line.components(separatedBy: "-")
                return (range[0], range[1])
            }
            .compactMap { range in
                let thing = Array(Int(range.0)!...Int(range.1)!)
                    .compactMap { value in
                        if String(value).splitStringInHalfAndCheckIfEqual() {
                            return value
                        }
                        return nil
                    }
                    .reduce(0, +)
                return thing
            }
            .reduce(0, +)
    }

    public static func getAnswerPart2(input: String) -> Int {
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
                    if str.repeats() {
                        numbersToAdd.append(i)
                    }
                }
            }

        return numbersToAdd.reduce(0, +)
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

    func repeats() -> Bool {
        let repetitionRegex = Regex(#"^(\w+?)\1+$"#)
        if let _ = repetitionRegex.firstMatch(in: self) {
            return true
        }
        return false
    }
}
