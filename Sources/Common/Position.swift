//
//  Position.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation
//

public struct Position: Equatable, Hashable {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public static var origin: Position {
        return Position(x: 0, y: 0)
    }
    
    public func move(vector: Direction) -> Position {
        switch vector {
        case .up:
            return Position(x: self.x, y: self.y + 1)
        case .right:
            return Position(x: self.x + 1, y: self.y)
        case .down:
            return Position(x: self.x, y: self.y - 1)
        case .left:
            return Position(x: self.x - 1, y: self.y)
        }
    }
    
    public func getAdjacentPositions() -> [Position] {
        Direction.allCases.map { direction in
            self.move(vector: direction)
        }
    }
    
    public func manhattanDistance(to other: Position, xExpansion: Int = 0, yExpansion: Int = 0) -> Int {
        let deltaX = abs(self.x - other.x) + xExpansion
        let deltaY = abs(self.y - other.y) + yExpansion
        return deltaX + deltaY
    }
    
    /// currently only does +1,-1 in any direction...
    public func vector(_ newPostion: Position) -> [Position] {
        var positions = [Position]()
        let dx = (newPostion.x - self.x) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        let dy = (newPostion.y - self.y) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        
        var currentPostion = self
        while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + dx, y: currentPostion.y + dy)
        }
        
        positions.append(newPostion)
        return positions
    }
    
    public func move(x: Int, y: Int) -> Position {
        Position(x: self.x + x, y: self.y + y)
    }
}

public extension Position {
    var matrix: [Position] {
        
        [(Position(x: self.x - 1, y: self.y - 1)),
         (Position(x: self.x - 1, y: self.y)),
         (Position(x: self.x - 1, y: self.y + 1)),
         (Position(x: self.x, y: self.y - 1)),
         (Position(x: self.x, y: self.y + 1)),
         (Position(x: self.x + 1, y: self.y - 1)),
         (Position(x: self.x + 1, y: self.y)),
         (Position(x: self.x + 1, y: self.y + 1)),
        ]
    }
    
    var window: [Position] {
        
        [(Position(x: self.x - 1, y: self.y - 1)),
         (Position(x: self.x, y: self.y - 1)),
         (Position(x: self.x + 1, y: self.y - 1)),
         (Position(x: self.x - 1, y: self.y)),
         (Position(x: self.x, y: self.y)),
         (Position(x: self.x + 1, y: self.y)),
         (Position(x: self.x - 1, y: self.y + 1)),
         (Position(x: self.x, y: self.y + 1)),
         (Position(x: self.x + 1, y: self.y + 1))
        ]
    }
}

public struct XYZ: Equatable, Hashable, Sendable {
    let x: Int
    let y: Int
    let z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public static let zero = XYZ(x: 0, y: 0, z: 0)
    
    public var energy: Int {
        abs(x) + abs(y) + abs(z)
    }
}




public class PriorityQueue<T: Hashable> {
    public var queue = [T:Int]()
    public var isEmpty: Bool {
        queue.isEmpty
    }
    
    public func enqueue(_ item: T, priority: Int) {
        queue[item] = priority
    }
    
    public func dequeue() -> T? {
        guard !queue.isEmpty else { return nil }
        let item = queue.sorted { p1, p2 in
            p1.value < p2.value
        }.first!.key
        queue.removeValue(forKey: item)
        return item
    }
}
