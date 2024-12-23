//
//  Day8_2024.swift
//  Created for TwentyTwentyFour
//
//  This file contains the solution for Day 8, 2024.
//

import Algorithms
import Common
import Regex

public struct Day8 {
    public static func getAnswerPart1(input: [String]) -> Int {
        let grid = Grid<String>(input)
        let set = Set(grid.grid.values.filter({ value in
            value != "."
        }))
        var results = Set<Position>()
        for node in set {
            let positions = grid.grid.filter { (key, value) in
                value == node
            }.keys.map { $0 as Position }
            
            positions.combinations(ofCount: 2).forEach { combo in
                results = results.union(getAntiNodes(combo[0], combo[1], in: grid))
            }
        }
        
        return results.count
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        // Your code for part 2
        return 0
    }
    
    private static func getAntiNodes(_ position1: Position, _ position2: Position, in grid: Grid<String>) -> [Position] {
        let xDifference = (position1.x - position2.x)
        let yDifference = (position1.y - position2.y)
        
        let newX1 = position1.x + xDifference
        let newY1 = position1.y + yDifference
        
        let newX2 = position2.x - xDifference
        let newY2 = position2.y - yDifference
        
        let newPosition1 = Position(x: newX1, y: newY1)
        let newPosition2 = Position(x: newX2, y: newY2)
        
        var results: [Position] =  []
        if !grid.isOutOfBounds(newPosition1) {
            results.append(newPosition1)
        }

        if !grid.isOutOfBounds(newPosition2) {
            results.append(newPosition2)
        }

        return results
        
    }
}
