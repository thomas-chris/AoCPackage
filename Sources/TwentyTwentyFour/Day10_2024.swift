//
//  Day10_2024.swift
//  Created for TwentyTwentyFour
//
//  This file contains the solution for Day 10, 2024.
//

import Algorithms
import Common
import Regex

public struct Day10 {
    public static func getAnswerPart1(input: [String]) -> Int {
        let grid = Grid<Int>(input) { value in
            Int(value) ?? .max
        }
        
        let starts = grid.grid.filter { key, value in
            value == 9
        }.keys.map { $0 }
        
        let things = starts
            .map { traversable(position: $0, value: 9, grid: grid) }
        return things.reduce(0,+)
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        // Your code for part 2
        return 0
    }
    
    private static func traversable(position: Position, value: Int, grid: Grid<Int>) -> Int {
        let returns = position.getAdjacentPositions().map { newPosition in
            
            if grid.grid[newPosition] == value - 1 {
                if value - 1 == 0 {
                    return 1
                } else {
                    return traversable(position: newPosition, value: value - 1, grid: grid)
                }
            } else {
                return 0
            }
        }
        
        return returns.filter { $0 >= 1 }.count
        }
}
