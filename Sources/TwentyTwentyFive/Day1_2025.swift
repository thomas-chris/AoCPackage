import Algorithms
import Common
@preconcurrency import Regex

public struct Day1 {

    static let part1Regex = Regex(#"([A-Za-z])(\d+)"#)

    // Function to move through an array with wraparound
    static func moveInArray<T>(array: [T], currentIndex: Int, steps: Int) -> Int {
        let arraySize = array.count
        guard arraySize > 0 else { return 0 }

        let newIndex = (currentIndex + steps) % arraySize
        return newIndex >= 0 ? newIndex : newIndex + arraySize
    }

    static let points = Array(0...99)
    static let start = 50

    static func createInstructions(input: [String]) -> [Int] {
        input.compactMap { instruction -> Int? in
            guard let result = part1Regex.firstMatch(in: instruction) else { return nil }
            if result.captures[0]?.uppercased() == "L" {
                return -(Int(result.captures[1]!) ?? 0)
            } else {
                return Int(result.captures[1]!) ?? 0
            }
        }
    }

    public static  func getAnswerPart1(input: [String]) -> Int {

        var currentIndex = points.firstIndex(of: start)!

        let instructions = createInstructions(input: input)

        var total = 0

        for instruction in instructions {
            currentIndex = moveInArray(array: points, currentIndex: currentIndex, steps: instruction)
            if points[currentIndex] == 0 {
                total += 1
            }
        }

        return total
    }

    public static  func getAnswerPart2(input: [String]) -> Int {
        var currentIndex = points.firstIndex(of: start)!

        let instructions = createInstructions(input: input)

        var total = 0

        return 0
    }
}
