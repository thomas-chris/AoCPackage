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
                results = results.union(getAntiNodes(combo[0], combo[1], in: grid, isInfinite: false))
            }
        }
        
        return results.count
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        let grid = Grid<String>(input)
        let settable = grid.grid.filter({ (key, value) in
            value != "."
        })
        let set = Set(settable.values)
        var results = Set(settable.keys)
        for node in set {
            let positions = grid.grid.filter { (key, value) in
                value == node
            }.keys.map { $0 as Position }
            
            positions.combinations(ofCount: 2).forEach { combo in
                results = results.union(getAntiNodes(combo[0], combo[1], in: grid, isInfinite: true))
            }
        }
        
        return results.count
    }
    
    private static func getAntiNodes(_ position1: Position, _ position2: Position, in grid: Grid<String>, isInfinite: Bool) -> [Position] {
        let xDifference = (position1.x - position2.x)
        let yDifference = (position1.y - position2.y)
        var results: [Position] =  []
        
        var isInGrid = true
        var variablePosition1 = position1
        while isInGrid {
            let newX = variablePosition1.x + xDifference
            let newY = variablePosition1.y + yDifference
            variablePosition1 = Position(x: newX, y: newY)
            
            if !grid.isOutOfBounds(variablePosition1) {
                results.append(variablePosition1)
                if !isInfinite {
                    isInGrid = false
                }
            } else {
                isInGrid = false
            }
            
        }
        
        isInGrid = true
        var variablePosition2 = position2
        while isInGrid {
            let newX = variablePosition2.x - xDifference
            let newY = variablePosition2.y - yDifference
            variablePosition2 = Position(x: newX, y: newY)
            
            if !grid.isOutOfBounds(variablePosition2) {
                results.append(variablePosition2)
                if !isInfinite {
                    isInGrid = false
                }
            } else {
                isInGrid = false
            }
        }
        
        return results
        
    }
}
