import Foundation

public class Grid<T> {
    
    public var columns: Int {
        grid.keys.max { $0.y < $1.y }!.y + 1
    }
    
    public var yRange: (Int, Int) {
        (grid.keys.max { $0.y > $1.y }!.y, grid.keys.max { $0.y < $1.y }!.y)
        
    }
    
    public var rows: Int {
        grid.keys.max { $0.x < $1.x }!.x + 1
    }
    
    public var xRange: (Int, Int) {
        (grid.keys.max { $0.x > $1.x }!.x, grid.keys.max { $0.x < $1.x }!.x)
    }
    
    public var grid: [Position: T]
    
    public init(_ input: [String]) {
        var dictionary = [Position: T]()
         
        for y in 0..<input.count {
            let row = input[y]
            for x in 0..<row.count {
                dictionary[Position(x: x, y: y)] = ((row[x]) as! T)
            }
        }
        
        
        grid = dictionary
    }
    
    public func print() {
        for y in yRange.0 ... yRange.1 {
            var row: [T] = []
            for x in xRange.0 ... yRange.1 {
                if let char = grid[Position(x: x, y: y)] {
                    
                    row.append(char)
                }
            }
            Swift.print(row)
        }
        
        Swift.print("\n")
    }
}

public extension Grid where T == Int {
    
    func dijkstra(start: Position, end: Position) -> Int {
        dijkstra(start: start, end: end, maxPoint: Position(x: rows - 1, y: columns - 1))
    }
    
    // https://www.redblobgames.com/pathfinding/a-star/introduction.html
    func dijkstra(start: Position, end: Position, maxPoint: Position, shouldDrawPath: Bool = false) -> Int {
        let queue = PriorityQueue<Position>()
        queue.enqueue(start, priority: 0)
        var cameFrom = [Position:Position]()
        var costSoFar = [Position: Int]()
        costSoFar[start] = 0
        
        while !queue.isEmpty {
            let current = queue.dequeue()!
            if current == end {
                break
            }
            
            for next in current.getAdjacentPositions().filter({ grid[$0] != nil }) {
                let gridPoint = Position(x: next.x % columns, y: next.y % rows)
                let gridScore = self.grid[gridPoint]!
                let newCost = costSoFar[current, default: 0] + gridScore
                if costSoFar[next] == nil || newCost < costSoFar[next, default: 0] {
                    costSoFar[next] = newCost
                    queue.enqueue(next, priority: newCost)
                    cameFrom[next] = current
                }
            }
        }
        
        return costSoFar[end, default: -1]
    }
}
