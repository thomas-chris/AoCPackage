import Algorithms
import Common
import Foundation
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
    
    // Function to move through array and count how many times index crosses 0
    static func moveAndCountZeroCrossings(array: [Int], currentIndex: Int, steps: Int) -> (newIndex: Int, zeroCrossings: Int) {
        let arraySize = array.count
        guard arraySize > 0 else { return (0, 0) }
        
        let newIndex = (currentIndex + steps) % arraySize
        let finalIndex = newIndex >= 0 ? newIndex : newIndex + arraySize
        
        // Count crossings by stepping through each position
        var crossings: Int = 0
        if steps > 0 {
            // Moving forward (right)
            for step in 1...steps {
                let nextIndex = (currentIndex + step) % arraySize
                // Check if we landed on index 0 and it's not our final destination
                if nextIndex == 0 && step < steps {
                    crossings += 1
                }
            }
        } else if steps < 0 {
            // Moving backward (left)
            for step in 1...abs(steps) {
                let nextIndex = (currentIndex - step + arraySize) % arraySize
                // Check if we landed on index 0 and it's not our final destination
                if nextIndex == 0 && step < abs(steps) {
                    crossings += 1
                }
            }
        }
        
        return (newIndex: finalIndex, zeroCrossings: crossings)
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
    
    public static func getAnswerPart2(input: [String]) -> Int {
        var currentIndex = points.firstIndex(of: start)!
        let instructions = createInstructions(input: input)
        var totalCrossings = 0
        
        for instruction in instructions {
            let result = moveAndCountZeroCrossings(array: points, currentIndex: currentIndex, steps: instruction)
            currentIndex = result.newIndex
            totalCrossings += result.zeroCrossings
        }
        
        let zeros = getAnswerPart1(input: input)
        return totalCrossings + zeros
    }
}
