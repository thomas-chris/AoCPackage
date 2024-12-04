//
//  Direction.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Direction: String, CaseIterable {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
    case upRight = "UR"
    case upLeft = "UL"
    case downRight = "DR"
    case downLeft = "DL"
    
    public var opposite: Direction {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .left:
            return .right
        case .right:
            return .left
        case .upRight:
            return .downLeft
        case .upLeft:
            return .downRight
        case .downRight:
            return .upLeft
        case .downLeft:
            return .upRight
        }
    }
}

public enum CardinalDirection: CaseIterable {
    case north
    case east
    case south
    case west
}
