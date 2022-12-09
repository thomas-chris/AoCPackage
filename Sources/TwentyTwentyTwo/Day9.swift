import Algorithms
import Foundation
import Regex
import Common

public struct Day9 {
    
    public static func part1(_ input: [String]) -> Int {
        
        let instructions = input.map { line in
            let components = line.components(separatedBy: " ")
            let direction = Direction(rawValue: components[0])!
            let value = Int(components[1]) ?? 0
            return (direction, value)
        }
        
        var headPosition = Position(x: 0, y: 0)
        var tailPosition = Position(x: 0, y: 0)
        var uniqueTailPositions = Set([tailPosition])
        
        for instruction in instructions {
            for i in 0..<instruction.1 {
                let newHeadPosition = headPosition.move(vector: instruction.0)
                let surroundingPositions = newHeadPosition.matrix
                if surroundingPositions.first(where: { $0 == tailPosition }) == nil {
                    
                    var moveX = 0
                    var moveY = 0
                    
                    if newHeadPosition.x == tailPosition.x - 2 {
                        moveX = -1
                        if newHeadPosition.y == tailPosition.y - 1 {
                            moveY = -1
                        }
                        
                        if newHeadPosition.y == tailPosition.y + 1 {
                            moveY = 1
                        }
                        
                    }
                    
                    if newHeadPosition.x == tailPosition.x + 2 {
                        moveX = 1
                        if newHeadPosition.y == tailPosition.y - 1 {
                            moveY = -1
                        }
                        
                        if newHeadPosition.y == tailPosition.y + 1 {
                            moveY = 1
                        }
                        
                    }
                    
                    if newHeadPosition.y == tailPosition.y - 2 {
                        moveY = -1
                        if newHeadPosition.x == tailPosition.x - 1 {
                            moveX = -1
                        }
                        
                        if newHeadPosition.x == tailPosition.x + 1 {
                            moveX = 1
                        }
                        
                    }
                    
                    if newHeadPosition.y == tailPosition.y + 2 {
                        moveY = 1
                        if newHeadPosition.x == tailPosition.x - 1 {
                            moveX = -1
                        }
                        
                        if newHeadPosition.x == tailPosition.x + 1 {
                            moveX = 1
                        }
                        
                    }
                    
                    tailPosition = Position(x: tailPosition.x + moveX, y: tailPosition.y + moveY)
                    uniqueTailPositions.insert(tailPosition)
                }
                
                headPosition = newHeadPosition
            }
        }
        return uniqueTailPositions.count
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        
        let instructions = input.map { line in
            let components = line.components(separatedBy: " ")
            let direction = Direction(rawValue: components[0])!
            let value = Int(components[1]) ?? 0
            return (direction, value)
        }
        
        var headPosition = Position(x: 0, y: 0)
        var ropePositions = [Position](repeating: Position(x: 0, y: 0), count: 9)
        var uniqueTailPositions = Set([headPosition])
        
        for instruction in instructions {
            for i in 0..<instruction.1 {
                let newHeadPosition = headPosition.move(vector: instruction.0)
                var positionToEvaluateAgainst = newHeadPosition
                var newRopePositions = [Position]()
                for (index, ropePosition) in ropePositions.enumerated() {
                    let surroundingPositions = positionToEvaluateAgainst.matrix
                    if surroundingPositions.first(where: { $0 == ropePosition }) == nil {
                        
                        var moveX = 0
                        var moveY = 0
                        
                        if positionToEvaluateAgainst.x == ropePosition.x - 2 {
                            moveX = -1
                            if positionToEvaluateAgainst.y == ropePosition.y - 1 {
                                moveY = -1
                            }
                            
                            if positionToEvaluateAgainst.y == ropePosition.y + 1 {
                                moveY = 1
                            }
                            
                        }
                        
                        if positionToEvaluateAgainst.x == ropePosition.x + 2 {
                            moveX = 1
                            if positionToEvaluateAgainst.y == ropePosition.y - 1 {
                                moveY = -1
                            }
                            
                            if positionToEvaluateAgainst.y == ropePosition.y + 1 {
                                moveY = 1
                            }
                            
                        }
                        
                        if positionToEvaluateAgainst.y == ropePosition.y - 2 {
                            moveY = -1
                            if positionToEvaluateAgainst.x == ropePosition.x - 1 {
                                moveX = -1
                            }
                            
                            if positionToEvaluateAgainst.x == ropePosition.x + 1 {
                                moveX = 1
                            }
                            
                        }
                        
                        if positionToEvaluateAgainst.y == ropePosition.y + 2 {
                            moveY = 1
                            if positionToEvaluateAgainst.x == ropePosition.x - 1 {
                                moveX = -1
                            }
                            
                            if positionToEvaluateAgainst.x == ropePosition.x + 1 {
                                moveX = 1
                            }
                            
                        }
                        
                        let newPosition = Position(x: ropePositions[index].x + moveX, y: ropePositions[index].y + moveY)
                        newRopePositions.append(newPosition)
                        
                        
                        positionToEvaluateAgainst = newPosition
                    } else {
                        newRopePositions.append(ropePositions[index])
                        positionToEvaluateAgainst = ropePositions[index]
                    }
                    
                    if index == 8 {
                        uniqueTailPositions.insert(newRopePositions[8])
                    }
                    
                }
                ropePositions = newRopePositions
                headPosition = newHeadPosition
                
            }
            
        }
        return uniqueTailPositions.count

    }
    
    
}
