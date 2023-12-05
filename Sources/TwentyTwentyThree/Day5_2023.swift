import Algorithms
import Common
import Foundation
import Regex

public struct Day5 {
    
    public static func getAnswerPart1(input: [String]) throws -> Int {
        var input = input
        let seeds = input.removeFirst()
        let components = seeds.components(separatedBy: ":")
        let seedsKey = components.first!
        let seedsValues = components.last!.components(separatedBy: " ").compactMap { Int($0) }
        
        let keys = ["seed-to-soil map", "soil-to-fertilizer map", "fertilizer-to-water map", "water-to-light map", "light-to-temperature map", "temperature-to-humidity map", "humidity-to-location map"]
        
        var dictionary = input.reduce(into: [String: [Int: (Int, Int)]]()) { partialResult, value in
            let components = value.components(separatedBy: "\n")
            let values = components.dropFirst()
            var instructions = [Int: (Int, Int)]()
            for list in values {
                guard !list.isEmpty else { return }
                let stringComponents = list.components(separatedBy: " ").compactMap { Int($0) }
                let end = stringComponents[0]
                let start = stringComponents[1]
                let range = stringComponents[2]-1
                instructions[start] = (end, range)
            }
            partialResult[components.first?.replacingOccurrences(of: ":", with: "") ?? "Nothing"] = instructions
        }
        
        var source = seedsValues
        for key in keys {
            guard let map = dictionary[key] else { break }
            source = getNextLocation(source, map: map)
        }
        
        return source.min() ?? 0
    }
    
    private static func getNextLocation(_ source: [Int], map: [Int: (Int, Int)]) -> [Int] {
        
        var output = [Int]()
        var exists = false
        for i in source {
            for j in map.keys {
                let sourceRange = j...(j+map[j]!.1)
                if let index = sourceRange.firstIndex(of: i) {
                    let value = sourceRange.distance(from: sourceRange.startIndex, to: index)
                    output.append(map[j]!.0 + value)
                    exists = true
                }
            }
            if !exists {
                output.append(i)
            }
            exists = false
        }
        
        return output
    }
    
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        
        return 0
    }
}


