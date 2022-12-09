import Algorithms
import Common
import Foundation
import Regex


public struct Day8 {
    
    public static func part1(_ input: [String]) -> Int {
        
        let maxX = (input.first?.count ?? 0) - 1
        let maxY = (input.count) - 1
        var positions = [Position: Int]()
        for y in 0..<input.count {
            for x in 0..<input[y].count {
                positions[Position(x: x, y: y)] = Int(input[y][x])
            }
        }
        
        var total = (2*maxY) + (2*maxX)
        for y in 1..<maxY {
            for x in 1..<maxX {
                if let value = positions[Position(x: x, y: y)] {
                    // check left
                    if (0..<x).map({ Position(x: $0, y: y) })
                        .first(where: { positions[$0] ?? -1 >= value }) == nil {
                        total += 1
                        continue
                    }
                    
                    // check right
                    if (x+1...maxX).map({ Position(x: $0, y: y) })
                        .first(where: { positions[$0] ?? -1 >= value }) == nil {
                        total += 1
                        continue
                    }
                    
                    // check top
                    if (0..<y).map({ Position(x: x, y: $0) })
                        .first(where: { positions[$0] ?? -1 >= value }) == nil {
                        total += 1
                        continue
                    }
                    
                    // check bottom
                    if (y+1...maxY).map({ Position(x: x, y: $0) })
                        .first(where: { positions[$0] ?? -1 >= value }) == nil {
                        total += 1
                        continue
                    }
                }
            }
        }
        
        return total
    }
    
    public static func part2(_ input: [String]) -> Int {
        let maxX = (input.first?.count ?? 0) - 1
        let maxY = (input.count) - 1
        var positions = [Position: Int]()
        for y in 0..<input.count {
            for x in 0..<input[y].count {
                positions[Position(x: x, y: y)] = Int(input[y][x])
            }
        }
        
        var highestScore = 0
        for y in 1..<maxY {
            for x in 1..<maxX {
                if let value = positions[Position(x: x, y: y)] {
                    
                    var left = 0
                    var right = 0
                    var top = 0
                    var bottom = 0
                    let leftTrees = (0..<x).map({ Position(x: $0, y: y)}).compactMap({ positions[$0]})
                    for tree in leftTrees.reversed() {
                        if tree < value {
                            left += 1
                        } else if tree >= value {
                            left += 1
                            break
                        } else {
                            break
                        }
                    }
                    
                    let rightTrees = (x+1...maxX).map({ Position(x: $0, y: y)}).compactMap({ positions[$0]})
                    for tree in rightTrees {
                        if tree < value {
                            right += 1
                        } else if tree >= value {
                            right += 1
                            break
                        } else {
                            break
                        }
                    }
                    
                    let topTrees = (0..<y).map({ Position(x: x, y: $0)}).compactMap({ positions[$0]})
                    for tree in topTrees.reversed() {
                        if tree < value {
                            top += 1
                        } else if tree >= value {
                            top += 1
                            break
                        } else {
                            break
                        }
                    }
                    
                    let bottomTrees = (y+1...maxY).map({ Position(x: x, y: $0)}).compactMap({ positions[$0]})
                    for tree in bottomTrees {
                        if tree < value {
                            bottom += 1
                        } else if tree >= value {
                            bottom += 1
                            break
                        } else {
                            break
                        }
                    }
                
                    let score = left * right * bottom * top

                    if score > highestScore {
                        highestScore = score
                    }
                }
            }
        }
        
        return highestScore
    }
    
    public static func part2Redo(_ input: [String]) -> Int {
        let maxX = (input.first?.count ?? 0) - 1
            let maxY = (input.count) - 1
            var positions = [Position: Int]()
            for y in 0..<input.count {
                for x in 0..<input[y].count {
                    positions[Position(x: x, y: y)] = Int(input[y][x])
                }
            }
            
            var highestScore = 0
            for y in 1..<maxY {
                for x in 1..<maxX {
                    let value = positions[Position(x: x, y: y)]!
                    let left = ((0..<x).map({ Position(x: $0, y: y)}).compactMap({ positions[$0] }).reversed().firstIndex(where: { $0 >= value }) ?? x-1) + 1
                    let right = ((x+1...maxX).map({ Position(x: $0, y: y)}).compactMap({ positions[$0] }).firstIndex(where: { $0 >= value }) ?? (maxY)-(x+1)) + 1
                    let top = ((0..<y).map({ Position(x: x, y: $0)}).compactMap({ positions[$0] }).reversed().firstIndex(where: { $0 >= value }) ?? y-1) + 1
                    let bottom = ((y+1...maxY).map({ Position(x: x, y: $0)}).compactMap({ positions[$0] }).firstIndex(where: { $0 >= value }) ?? (maxX)-(y+1)) + 1
                    let score = left * right * bottom * top
                    
                    if score > highestScore {
                        highestScore = score
                    }
                }
            }
            
            return highestScore
    }
}

