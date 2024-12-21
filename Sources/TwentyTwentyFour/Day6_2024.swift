import Algorithms
import Common
import Regex

public struct Day6 {
    public static func getAnswerPart1(input: [String]) -> Int {
        let grid = Grid<String>(input)
        return prepGrid(grid).grid.values.count { value in
            value == "X"
        }
    }

    struct PositionDirection: Hashable {
        let position: Position
        let direction: Direction
        
        init(_ position: Position, _ direction: Direction) {
            self.position = position
            self.direction = direction
        }
    }
    public static func getAnswerPart2(input: [String]) -> Int {
        // Initialize the grid from input
        let safeGrid = Grid<String>(input)
        let newSafeGrid = Grid<String>(input)
        // Find the start position or exit gracefully
        guard let start = safeGrid.grid.first(where: { $0.value == "^" })?.key else {
            print("Couldn't find a start position")
            return 0
        }
        
        // Prepare the grid and set the start position
        var preppedGrid = prepGrid(safeGrid)
        preppedGrid.grid[start] = "^"
        
        var countedObstacles: Set<Position> = [] // Ensure obstacles are counted only once
        var countObstacles = 0
        
        // Iterate over all keys with value "X"
        let obstacleKeys = preppedGrid.grid.filter { $0.value == "X" }.keys.sorted { a, b in
            a.x > b.x
        }.sorted { a, b in
            a.y > b.y
        }
        
        print(obstacleKeys.count)
        var count = 0
        for key in obstacleKeys {
            if countedObstacles.contains(key) { continue } // Skip already counted obstacles
            count += 1
            print(count)
            var seenPositions: Set<PositionDirection> = []
            
            // Clone safeGrid to modify for the current key
            var alterableGrid = newSafeGrid
            alterableGrid.grid[key] = "0"
            
            var inBounds = true
            var currentPosition = start
            var currentDirection: Direction = .down
            
            while inBounds {
                let newPosition = currentPosition.move(vector: currentDirection)
                
                if alterableGrid.isOutOfBounds(newPosition) {
                    inBounds = false
                } else {
                    let positionDirection = PositionDirection(newPosition, currentDirection)
                    
                    if alterableGrid.grid[newPosition] == "0" || alterableGrid.grid[newPosition] == "#" {
                        if seenPositions.contains(positionDirection) {
                            inBounds = false
                            countedObstacles.insert(key) // Mark this obstacle as counted
                            countObstacles += 1
                        } else {
                            seenPositions.insert(positionDirection)
                            currentDirection = currentDirection.rotateRight()
                        }
                    } else {
                        currentPosition = newPosition
                    }
                }
            }
        }
        
        return countObstacles
    }

    
    private static func prepGrid(_ grid: Grid<String>) -> Grid<String> {
        var grid = grid
        guard let start = grid.grid.first(where: { (key, value) in
            value == "^"
        })?.key else { fatalError("Couldn't find a start position") }
        
        grid.grid[start] = "X"
        var inBounds = true
        var currentPosition = start
        var currentDirection: Direction = .down
        
        while inBounds {
            let newPosition = currentPosition.move(vector: currentDirection)
            if grid.isOutOfBounds(newPosition) {
                inBounds = false
            } else if grid.grid[newPosition] == "#" {
                currentDirection = currentDirection.rotateRight()
                
            } else {
                
                grid.grid[newPosition] = "X"
                currentPosition = newPosition
            }
        }
        
        return grid
    }
}
