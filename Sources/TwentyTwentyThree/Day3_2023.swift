import Algorithms
import Common
import Foundation

public struct Day3 {
    
    public static func getAnswerPart1(input: [String]) -> Int {
        let rows = input.count
        let columns = input.first!.count
        let grid = Grid<String>(input)
        
        let filteredGrid = grid.grid.filter { (key: Position, value: String) in
            value != "."
        }
        
        var currentPart = ""
        var hasPart: [Bool] = []
        var parts = [Int]()
        for row in 0...rows-1 {
            for column in 0...columns-1 {
                let position = Position(x: column, y: row)
                if let value = filteredGrid[position] {
                    if let _ = Int(value) {
                        currentPart.append(value)
                        hasPart.append(checkPositionForSymbol(position, grid: filteredGrid))
                    } else {
                        if !hasPart.allSatisfy({ !$0 }) {
                            parts.append(Int(currentPart)!)
                            
                        }
                        hasPart = []
                        currentPart = ""
                    }
                } else if let _ = filteredGrid[position] {
                    
                } else {
                    if !hasPart.allSatisfy({ !$0 }) {
                        parts.append(Int(currentPart)!)
                        
                    }
                    hasPart = []
                    currentPart = ""
                }
                
            }
            if !hasPart.allSatisfy({ !$0 }) {
                parts.append(Int(currentPart)!)
                
            }
            hasPart = []
            currentPart = ""
            
        }
        
        return parts.reduce(0,+)
    }
    
    private static func checkPositionForSymbol(_ position: Position, grid: [Position : String]) -> Bool {
        let matrix = position.matrix
        
        for position in matrix {
            if let value = grid[position],
               Int(value) == nil {
                return true
            }
        }
        
        return false
    }
    
    public static func getAnswerPart2(input: [String]) -> Int {
        
        let grid = Grid<String>(input)
        
        let filteredGrid = grid.grid.filter { (key: Position, value: String) in
            value != "."
        }
        
        let positionsOfGears = filteredGrid.filter { (key: Position, value: String) in
            value == "*"
        }.keys
        
        var numbersForGears = [Position: [Int]]()
        
        for position in positionsOfGears {
            let gears = extractNumbers(for: position, from: filteredGrid)
            numbersForGears[position] = gears
        }
        
        let filteredGears = numbersForGears.filter { (key: Position, value: [Int]) in
            return value.count == 2
        }
        
        return filteredGears.values.map { $0.reduce(1, *) }.reduce(0, +)
    }
    
    private static func extractNumbers(for position: Position, from grid: [Position: String]) -> [Int] {
        
        let matrix = position.matrix
        var parts = [Int]()
        var grid = grid
        for postion in matrix {
            var currentPart = [""]
            if let value = grid[postion],
                let _ = Int(value) {
                currentPart = [value]
                
                var moveLeft = true
                var moveRight = true
                var currentPostion = postion
    
                while moveLeft {
                    currentPostion = currentPostion.move(vector: .left)
                    if let value = grid[currentPostion],
                       let _ = Int(value) {
                        currentPart.insert(value, at: 0)
                        grid[currentPostion] = ""
                    } else {
                        moveLeft = false
                    }
                    
                }
                
                currentPostion = postion
                while moveRight {
                    currentPostion = currentPostion.move(vector: .right)
                    if let value = grid[currentPostion],
                       let _ = Int(value) {
                        currentPart.append(value)
                        grid[currentPostion] = ""
                    } else {
                        moveRight = false
                    }
                    
                }
                
            }
            
            if let number = Int(currentPart.reduce("", +)) {
                parts.append(number)
            }
        }
        
        return parts
    }
}


