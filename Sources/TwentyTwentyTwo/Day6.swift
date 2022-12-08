import Algorithms
import Foundation
import Regex


public struct Day6 {
    
    public static func part1(_ input: String) -> Int {
        
        findStart(input, length: 4)
    }
    
    public static func part2(_ input: String) -> Int {
        findStart(input, length: 14)
    }
    
    public static func findStart(_ input: String, length: Int) -> Int {
        for i in (length-1..<input.count) {
            if Set(input[i-length+1 ..< i+1]).count == length {
                return i + 1
            }
        }
        fatalError("Should not have reached here")
    }
}
    
    
