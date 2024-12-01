import Algorithms
import AppKit
import Common
import Foundation
import Regex

public struct Day10 {
    typealias PipeGraph = [Position: Pipe]
    
    enum Pipe: String, CaseIterable {
        case vertical = "|"
        case horizontal = "-"
        case northEast = "L"
        case northWest = "J"
        case southWest = "7"
        case southEast = "F"
        case ground = "."
        case start = "S"
    }
    

    public static func getAnswerPart1(input: [String]) throws -> Int {
        
        findMaxDistance(sketch: input).0
    }
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
//        let valuesAndDistance = findMaxDistance(sketch: input)
        
        return 0
    }
    
    private static func validneighbours(for pipe: Pipe, at position: Position, in graph: [Position: Pipe]) -> [Position] {
        var neighbours: [Position] = []
        let candidatePositions = [
            Position(x: position.x, y: position.y + 1),
            Position(x: position.x, y: position.y - 1),
            Position(x: position.x + 1, y: position.y),
            Position(x: position.x - 1, y: position.y)
        ]
        if pipe == .start {
            for potentialPipe in Pipe.allCases {
                for pairs in candidatePositions.allUniquePairs() {
                    if let candidatePipe = graph[pairs.0],
                       let secondCandidate = graph[pairs.1] {
                        if isValidConnection(from: potentialPipe, to: candidatePipe, from: position, to: pairs.0) && isValidConnection(from: potentialPipe, to: secondCandidate, from: position, to: pairs.1) {
                            neighbours.append(pairs.0)
                            neighbours.append(pairs.1)
                        }
                    }
                }
            }
            return neighbours
        }
        
        for candidatePosition in candidatePositions {
            if let candidatePipe = graph[candidatePosition] {
                if isValidConnection(from: pipe, to: candidatePipe, from: position, to: candidatePosition) {
                    neighbours.append(candidatePosition)
                }
            }
        }

        return neighbours
    }
    
    // Helper function to check if the connection from the current pipe to the next pipe is valid
    // Helper function to check if the connection from the current pipe to the next pipe is valid
    private static func isValidConnection(from currentPipe: Pipe, to nextPipe: Pipe, from position: Position, to nextPosition: Position) -> Bool {
        switch currentPipe {
        case .vertical:
            return (nextPipe == .vertical && (position.y - 1 == nextPosition.y ||  position.y + 1 == nextPosition.y))  ||
            (nextPipe == .southEast && position.y - 1 == nextPosition.y) ||
            (nextPipe == .southWest && position.y - 1 == nextPosition.y) ||
            (nextPipe == .northEast && position.y + 1 == nextPosition.y) ||
            (nextPipe == .northWest && position.y + 1 == nextPosition.y)
        case .horizontal:
            return (nextPipe == .horizontal && (position.x - 1 == nextPosition.x || position.x + 1 == nextPosition.x)) ||
            (nextPipe == .northEast && position.x - 1 == nextPosition.x) ||
            (nextPipe == .southWest && position.x + 1 == nextPosition.x) ||
            (nextPipe == .northWest && position.x + 1 == nextPosition.x) ||
            (nextPipe == .southEast && position.x - 1 == nextPosition.x)
        case .northEast:
            return (nextPipe == .vertical && position.y - 1 == nextPosition.y) ||
            (nextPipe == .horizontal && position.x + 1 == nextPosition.x) ||
            (nextPipe == .northWest && position.x + 1 == nextPosition.x) ||
            (nextPipe == .southWest && (position.x + 1 == nextPosition.x || position.y - 1 == nextPosition.y)) ||
            (nextPipe == .southEast && position.y - 1 == nextPosition.y)
            
        case .northWest:
            return (nextPipe == .vertical && position.y - 1 == nextPosition.y) ||
            (nextPipe == .horizontal && position.x - 1 == nextPosition.x) ||
            (nextPipe == .northEast && position.x - 1 == nextPosition.x) ||
            (nextPipe == .southEast && (position.x - 1 == nextPosition.x || position.y - 1 == nextPosition.y)) ||
            (nextPipe == .southWest && position.y - 1 == nextPosition.y)
        case .southWest:
            return (nextPipe == .vertical && position.y + 1 == nextPosition.y) ||
            (nextPipe == .northEast && (position.x - 1 == nextPosition.x || position.y + 1 == nextPosition.y)) ||
            (nextPipe == .horizontal && position.x - 1 == nextPosition.x) ||
            (nextPipe == .northWest && position.y + 1 == nextPosition.y) ||
            (nextPipe == .southEast && position.x - 1 == nextPosition.x)
        case .southEast:
            return (nextPipe == .vertical && position.y + 1 == nextPosition.y) ||
            (nextPipe == .northEast && position.y + 1 == nextPosition.y) ||
            (nextPipe == .horizontal && position.x + 1 == nextPosition.x) ||
            (nextPipe == .northWest && (position.x + 1 == nextPosition.x || position.y + 1 == nextPosition.y)) ||
            (nextPipe == .southWest && position.x + 1 == nextPosition.x )
        default:
            return false
        }
    }

    private static func findMaxDistance(sketch: [String]) -> (Int, Grid<String>)  {
        var pipeGraph: [Position: Pipe] = [:]
        let basicInput = Array(repeating: Array(repeating: ".", count: sketch.first!.count).reduce("", +), count: sketch.count)
        let grid = Grid<String>(basicInput)
        
        // Parse the sketch and fill the pipeGraph dictionary
        for (y, line) in sketch.enumerated() {
            for (x, char) in line.enumerated() {
                let position = Position(x: x, y: y)
                if let pipe = Pipe(rawValue: String(char)) {
                    pipeGraph[position] = pipe
                }
            }
        }

        // Perform BFS to find the maximum distance
        var visited: Set<Position> = []
        var visitedAndDistance = Array<(Position, Int)>()
        var queue: [(Position, Int)] = []

        let startPosition = pipeGraph.filter { (key, value) in
            value == .start
        }.keys.first!
        
        visited.insert(startPosition)
        queue.append((startPosition, 0))
        grid.grid[startPosition] = "S"
        visitedAndDistance.append((startPosition, 0))
        var maxDistance = 0

        while !queue.isEmpty {
            let (current, distance) = queue.removeFirst()
            maxDistance = max(maxDistance, distance)

            if let currentPipe = pipeGraph[current] {
                // Get valid neighbouring positions based on the current pipe
                let neighbours = validneighbours(for: currentPipe, at: current, in: pipeGraph)

                for neighbour in neighbours {
                    if !visited.contains(neighbour) {
                        visited.insert(neighbour)
                        visitedAndDistance.append((neighbour, distance + 1))
                        queue.append((neighbour, distance + 1))
                        grid.grid[neighbour] = "#"
                    }
                }
            }
        }

        grid.print()
        return (maxDistance, grid)
    }
    
}

//
//let savedValues = valuesAndDistance.1.map { $0.0 }
//var values = valuesAndDistance.1
//let maxDistance = valuesAndDistance.0
//let startIndex = values.firstIndex { (position, distance) in
//    distance == 0
//}!
//
//let start = values[startIndex]
//values.remove(at: startIndex)
//
//var orderedPositions = [start.0]
//
//var nextIndex = values.firstIndex { (position, distance) in
//    distance == 1
//}!
//
//var next = values.remove(at: nextIndex)
//orderedPositions.append(next.0)
//var count = 1
//while !values.isEmpty && count < maxDistance {
//    let newPositions = next.0.getAdjacentPositions()
//    let previousDistance = next.1
//    for valuePosition in values {
//        for newPosition in newPositions {
//            if let distanceOfNewPosition = values.first(where: { (position, distance) in
//                position == newPosition &&  (maxDistance >= distance ? distance == previousDistance + 1 : distance >= previousDistance - 1)
//            }) {
//                orderedPositions.append(distanceOfNewPosition.0)
//                    next = distanceOfNewPosition
//                    values.removeAll { (position, distance) in
//                        position == distanceOfNewPosition.0
//                    }
//                count += 1
//                }
//            }
//        }
//}
//
//for distance in 1...(maxDistance - 1) {
//    let index = values.firstIndex { (position, fromDistance) in
//        distance == fromDistance
//    }!
//    let position = values.remove(at: index)
//    orderedPositions.append(position.0)
//}
