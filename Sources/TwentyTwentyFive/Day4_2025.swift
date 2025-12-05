//
//  Day4_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 4, 2025.
//

import Algorithms
import Common
import Regex

public struct Day4 {

    typealias GridType = [[Character]]

    public static func getAnswerPart1(input: [String]) -> Int {
        let grid = input.map { Array($0) }
        let rows = grid.count
        let cols = grid[0].count
        
        return assess(grid, rows: rows, cols: cols).0
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        var grid = input.map { Array($0) }
        let rows = grid.count
        let cols = grid[0].count

        var assessContinues = true
        var accessibleCount = 0
        while assessContinues {
            let assement = assess(grid, rows: rows, cols: cols)
            accessibleCount += assement.0
            grid = assement.1
            if assement.0 == 0 {
                assessContinues = false
            }
        }
        return accessibleCount
    }

    private static func assess(_ grid: GridType, rows: Int, cols: Int) -> (Int, GridType) {
        var accessibleCount = 0
        var newGrid = grid
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "@" {
                    let neighborCount = countAdjacentRolls(grid: grid, row: row, col: col)

                    if neighborCount < 4 {
                        accessibleCount += 1
                        newGrid[row][col] = "."
                    }
                }
            }
        }

        return (accessibleCount, newGrid)
    }


    private static func countAdjacentRolls(grid: [[Character]], row: Int, col: Int) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var count = 0
        
        // Check all 8 adjacent directions
        let directions = [
            (-1, -1), (-1, 0), (-1, 1),  // Top-left, top, top-right
            (0, -1),           (0, 1),   // Left, right
            (1, -1),  (1, 0),  (1, 1)    // Bottom-left, bottom, bottom-right
        ]
        
        for (deltaRow, deltaCol) in directions {
            let newRow = row + deltaRow
            let newCol = col + deltaCol
            
            // Check bounds and if position contains a roll
            if newRow >= 0 && newRow < rows && 
                newCol >= 0 && newCol < cols && 
                grid[newRow][newCol] == "@" {
                count += 1
            }
        }
        
        return count
    }
}
