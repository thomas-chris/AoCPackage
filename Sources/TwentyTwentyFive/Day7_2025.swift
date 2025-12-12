//
//  Day7_2025.swift
//  Created for TwentyTwentyFive
//
//  This file contains the solution for Day 7, 2025.
//

import Algorithms
import Common
import Regex

public struct Day7 {
    public static func getAnswerPart1(input: [String]) -> Int {

        let grid = Grid<String>(input)
        var keys = grid.positions(for: "S")
        var visited = Set<Position>()

        while !keys.isEmpty {
            let position = keys.removeFirst()
            let next = position.move(vector: .up)

            guard !grid.isOutOfBounds(next) else { continue }

            if grid.grid[next] == "^" {
                guard !visited.contains(next) else { continue }
                visited.insert(next)
                let left = next.move(vector: .left)
                let right = next.move(vector: .right)
                if left.x >= 0 {
                    keys.append(left)
                }
                if right.x < grid.columns {
                    keys.append(right)
                }
            } else {
                keys.append(next)
            }
        }

        return visited.count
    }

    public static func getAnswerPart2(input: [String]) -> Int {

        let grid = Grid<String>(input)
        var positions = [grid.positions(for: "S").first!: 1]
        var splitters: [Position: Int] = [:]

        while !positions.isEmpty {
            var pending: [Position: Int] = [:]

            for (position, value) in positions {
                let next = position.move(vector: .up)
                guard next.y < grid.rows else { continue }

                if grid.grid[next] == "^" {
                    splitters[next] = splitters[next, default: 0] + value
                    pending[next.move(vector: .left)] = pending[next.move(vector: .left), default: 0] + value
                    pending[next.move(vector: .right)] = pending[next.move(vector: .right), default: 0] + value
                } else {
                    pending[next] = pending[next, default: 0] + value
                }
            }

            positions = pending
        }

        return splitters.reduce(1) { $0 + $1.value }
    }
}
