import Algorithms
import Common
import Regex

public struct Day1 {
    public static  func getAnswerPart1(input: [String]) -> Int {
        var lists: ([Int], [Int]) = ([], [])
        input.forEach { line in
            let components = line.components(separatedBy: "   ")
            lists.0.append(Int(components[0])!)
            lists.1.append(Int(components[1])!)
        }
        
        let ordererdFirst = lists.0.sorted()
        let ordererdSecond = lists.1.sorted()
        
        var totalDistance = 0
        for i in 0..<ordererdFirst.count {
            totalDistance += abs(ordererdFirst[i] - ordererdSecond[i])
        }
        
        return totalDistance
    }
    
    public static  func getAnswerPart2(input: [String]) -> Int {
        var lists: ([Int], [Int]) = ([], [])
        input.forEach { line in
            let components = line.components(separatedBy: "   ")
            lists.0.append(Int(components[0])!)
            lists.1.append(Int(components[1])!)
        }
        
        let counts = lists.1.reduce(into: [:]) { counts, number in
            counts[number, default: 0] += 1
        }
        
        let total = lists.0.reduce(into: 0) { partialResult, number in
            partialResult = partialResult + (number * (counts[number] ?? 0))
        }
        
        return total
    }
}
