import Algorithms
import Common
import Regex

public actor Day4 {
    
    public struct XMAS: Sequence {
        let values: [String] = ["X", "M", "A", "S"]
        
        public func makeIterator() -> XMASIterator {
            return XMASIterator(self.values)
        }
    }
    
    public struct XMASIterator: IteratorProtocol {
        private let values: [String]
        private var index: Int?
        
        init(_ values: [String]) {
            self.values = values
        }
        
        mutating public func next() -> String? {
            if let index = self.index, index < self.values.count - 1 {
                self.index = index + 1
                return self.values[index]
            } else if index == nil, !self.values.isEmpty {
                self.index = 0
                return self.values[0]
            }
            return nil
        }
    }
    
    public static  func getAnswerPart1(input: [String]) -> Int {
        let grid = Grid<String> (input)
        return part1(for: grid)
    }
    
    public static  func getAnswerPart2(input: [String]) -> Int {
        let grid = Grid<String> (input)
        return part2(for: grid)
    }
    
    public static func part2(for grid: Grid<String>) -> Int {
        let newGrid = grid.grid.filter { (key: Position, value: String) in
            value.uppercased() == "A"
        }
        
        return newGrid.keys.map { position in
            var total = 0
            
            if (
                    ((grid.grid[position.move(x: -1, y: -1)] == "M") && (grid.grid[position.move(x: 1, y: 1)] == "S"))
                        ||
                    ((grid.grid[position.move(x: -1, y: -1)] == "S") && (grid.grid[position.move(x: 1, y: 1)] == "M"))
                )
                &&
                (
                    ((grid.grid[position.move(x: -1, y: 1)] == "M") && (grid.grid[position.move(x: 1, y: -1)] == "S"))
                        ||
                    ((grid.grid[position.move(x: -1, y: 1)] == "S") && (grid.grid[position.move(x: 1, y: -1)] == "M"))
                ) {
                total += 1
            }
            return total
        }
        .reduce(0, +)
    }
    
    public static func part1(for grid: Grid<String>) -> Int {
        let newGrid = grid.grid.filter { (key: Position, value: String) in
            value.uppercased() == "X"
        }
        
        return newGrid.keys.map { position in
            var total = 0
            
            if ("X" + (grid.grid[position.move(x: 1, y: 0)] ?? "") + (grid.grid[position.move(x: 2, y: 0)] ?? "") + (grid.grid[position.move(x: 3, y: 0)] ?? "") == "XMAS") {
                total += 1
            }
            if ("X" + (grid.grid[position.move(x: 0, y: 1)] ?? "") + (grid.grid[position.move(x: 0, y: 2)] ?? "") + (grid.grid[position.move(x: 0, y: 3)] ?? "") == "XMAS") {
                total += 1
            }
            if ("X" + (grid.grid[position.move(x: -1, y: 0)] ?? "") + (grid.grid[position.move(x: -2, y: 0)] ?? "") + (grid.grid[position.move(x: -3, y: 0)] ?? "") == "XMAS") {
                total += 1
            }
            if ("X" + (grid.grid[position.move(x: 0, y: -1)] ?? "") + (grid.grid[position.move(x: 0, y: -2)] ?? "") + (grid.grid[position.move(x: 0, y: -3)] ?? "") == "XMAS") {
                total += 1
            }
            
            if ("X" + (grid.grid[position.move(x: 1, y: 1)] ?? "") + (grid.grid[position.move(x: 2, y: 2)] ?? "") + (grid.grid[position.move(x: 3, y: 3)] ?? "") == "XMAS") {
                total += 1
            }
            
            if ("X" + (grid.grid[position.move(x: -1, y: -1)] ?? "") + (grid.grid[position.move(x: -2, y: -2)] ?? "") + (grid.grid[position.move(x: -3, y: -3)] ?? "") == "XMAS") {
                total += 1
            }
            
            if ("X" + (grid.grid[position.move(x: 1, y: -1)] ?? "") + (grid.grid[position.move(x: 2, y: -2)] ?? "") + (grid.grid[position.move(x: 3, y: -3)] ?? "") == "XMAS") {
                total += 1
            }
            
            if ("X" + (grid.grid[position.move(x: -1, y: 1)] ?? "") + (grid.grid[position.move(x: -2, y: 2)] ?? "") + (grid.grid[position.move(x: -3, y: 3)] ?? "") == "XMAS") {
                total += 1
            }
            
            if total > 0 {
                print("\(position), total: \(total)")
            }
            return total
        }
            .reduce(0, +)
    }
    public static func process(_ position: Position, for grid: Grid<String>, with xmasIterator: inout XMASIterator) -> Int {
        var totalXmases = 0
        
        if grid.grid[position]?.uppercased() == xmasIterator.next() {
            Direction.allCases.forEach { direction in
                if check(position, with: &xmasIterator, in: direction, for: grid) {
                    totalXmases += 1
                }
            }
        }
        return totalXmases
    }
    
    public static func check(_ position: Position, with xmasIterator: inout XMASIterator, in direction: Direction, for grid: Grid<String>) -> Bool {
        
        let newPosition = position.move(vector: direction)
        
        if (newPosition.x >= grid.xRange.0 && newPosition.x <= grid.xRange.1) &&
            (newPosition.y >= grid.yRange.0 && newPosition.y <= grid.yRange.1) {
            let next = xmasIterator.next()
            if let value = grid.grid[newPosition],
               next != nil,
               value.uppercased() == next {
                return check(newPosition, with: &xmasIterator, in: direction, for: grid)
            } else if grid.grid[newPosition]?.uppercased() == "S" && next == nil {
                return true
            } else {
                return false
            }
        } else { return false }
    }
}
