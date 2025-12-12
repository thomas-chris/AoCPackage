//
//  Day6_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 6, 2025.
//

import Algorithms
import Common
import Regex

public struct Day6 {

    public static func getAnswerPart1(input: [String]) -> Int {
        let instructions = input.last?
            .trimmingCharacters(in: .whitespaces)
            .components(separatedBy: " ")
            .filter({ value in
                !value.isEmpty
            }) ?? []

        let actions = input
            .dropLast()
            .map { line in
                line.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
                    .compactMap { Int($0) }
            }
            .transposed()

        var result = 0
        actions.enumerated().forEach { index, actionList in
            let instruction = instructions[index]
            switch instruction {
            case "*":
                result += actionList.reduce(1, *)
            case "+":
                result += actionList.reduce(0, +)
            default:
                print(instruction)
                fatalError()
            }
        }

        return result
    }

    public static func getAnswerPart2_wrong(input: [String]) -> Int {

        let instructions = input.last?
            .trimmingCharacters(in: .whitespaces)
            .components(separatedBy: " ")
            .filter({ value in
                !value.isEmpty
            }) ?? []

        let actions = input
            .dropLast()
            .map { line in
                return Array(line.chunks(ofCount: 4))
                    .map { String($0.prefix(3)) }
            }
            .transposed()
            .map { Array($0)
                    .transposedStrings()
                    .map { $0.trimmingCharacters(in: .whitespaces)}
                    .compactMap { Int($0) }
            }

        var result = 0
        actions.enumerated().forEach { index, actionList in
            let instruction = instructions[index]
            switch instruction {
            case "*":
                result += actionList.reduce(1, *)
            case "+":
                result += actionList.reduce(0, +)
            default:
                print(instruction)
                fatalError()
            }
        }

        return result
    }

    enum Problem {
        case multiply
        case add
    }

    static func calculate(total: inout Int, values: [Int], problem: Problem) {
        switch problem {
        case .add:
            total += values.reduce(0, +)

        case .multiply:
            total += values.reduce(1, *)
        }
    }

    static func findProblem(at index: Int, in input: [String]) -> Problem {
        switch input.last![index] {
        case "+": .add
        case "*": .multiply
        default: .add
        }
    }

    public static func getAnswerPart2(input: [String]) -> Int {

        let columns = input.first!.count
        var problem = Problem.add
        var values: [Int] = []
        var total = 0

        problem = findProblem(at: 0, in: input)

        for x in 0..<columns {
            var digits: String = ""
            for y in 0..<input.count - 1 {
                digits.append(String(input[y][x]))
            }

            let value = Int(digits.compactMap { Int(String($0)) == nil ? nil : String($0) }.joined())

            guard let value else {
                calculate(total: &total, values: values, problem: problem)
                values.removeAll()

                if x + 1 < columns {
                    problem = findProblem(at: x + 1, in: input)
                }
                continue
            }
            values.append(value)
        }

        calculate(total: &total, values: values, problem: problem)

        return total
    }

}

extension Array where Element == String {
    func transposedStrings() -> [String] {
        guard !self.isEmpty else { return [] }

        let maxLength = self.map { $0.count }.max() ?? 0
        guard maxLength > 0 else { return [] }

        return (0..<maxLength).map { position in
            self.map { string in
                position < string.count ? String(string[string.index(string.startIndex, offsetBy: position)]) : ""
            }.joined()
        }
    }
}
