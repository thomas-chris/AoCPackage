import Algorithms
import Foundation
import Regex
import Common

public struct Day15 {
    
    public static func part1(_ input: [String]) -> Int {
        
        let positions = Grid(input)
        
        return positions.dijkstra(start: Position(x: 0, y: 0), end: Position(x: positions.rows - 1, y: positions.columns - 1))
    }
    
    public static func part2(_ input: [String]) -> Int {
        let maxX = input.first!.count
        let maxY = input.count
        let positions = Grid(input)
        
        for x in 0..<maxX {
            for y in 0..<maxY {
                for i in 1...5 {
                    var value = positions.grid[Position(x: x, y: y), default: 0] + (i - 1)
                    if value > 9 {
                        value = value % 9
                    }
                    positions.grid[Position(x: (x + ((i - 1) * maxX)), y: y)] = value
                }
            }
        }
        
        for x in 0 ..< (maxX*5) {
            for y in 0..<maxY {
                for i in 1...5 {
                    var value = positions.grid[Position(x: x, y: y), default: 0] + (i - 1)
                    if value > 9 {
                        value -= 9
                    }
                    positions.grid[Position(x: x, y: (y + ((i - 1) * maxY)))] = value
                }
            }
        }
        
        return positions.dijkstra(start: Position(x: 0, y: 0), end: Position(x: positions.rows - 1, y: positions.columns - 1))
    }
    
    private static func parse(_ input: [String]) {
    
    }
}
