//
//  Day9_2024.swift
//  Created for TwentyTwentyFour
//
//  This file contains the solution for Day 9, 2024.
//

import Algorithms
import Common
import Regex

public struct Day9 {
    public static func getAnswerPart1(input: String) -> Int {
        
        let diskMap = createDisk(input: input)
        let alteredDisk = moveValues(diskMap).compactMap { $0 }
        return checkSum(alteredDisk)
    }

    public static func getAnswerPart2(input: String) -> Int {
        let diskMap = createDisk(input: input)
        let alteredDisk = moveChunks(diskMap)
        return checkSum(alteredDisk)
    }
    
    private static func moveValues(_ array: [Int?]) -> [Int?] {
        var array = array
        var process = true
        while process {
            
            guard let lastValueIndex = array.lastIndex(where: { $0 != nil }),
                  let lastValue = array[lastValueIndex] else {
                return array
            }
            
            guard let firstNilIndex = array.firstIndex(of: nil) else {
                return array
            }
            
            if lastValueIndex < firstNilIndex {
                process = false
                return array
            }
            
            array[firstNilIndex] = lastValue
            array[lastValueIndex] = nil
        }
        return array
    }
    
    private static func moveChunks(_ array: [Int?]) -> [Int?] {
        let set = Set(array.compactMap { $0 }).sorted(by: { a, b in
            a > b
        })
        var array = array
        for value in set {
            guard let lastValueIndex = array.lastIndex(where: { $0 ==  value }) else {
                return array
            }
            
            // Determine the chunk of identical values at the end
            let lastValue = array[lastValueIndex]
            var chunkStartIndex = lastValueIndex
            
            while chunkStartIndex > 0 && array[chunkStartIndex - 1] == lastValue {
                chunkStartIndex -= 1
            }
            
            let chunk = array[chunkStartIndex...lastValueIndex]
            let chunkSize = chunk.count
            
            // Find a sequence of consecutive nil spaces large enough to fit the chunk
            var nilStartIndex: Int? = nil
            var currentNilCount = 0
            
            for (index, value) in array.enumerated() {
                if value == nil {
                    if nilStartIndex == nil {
                        nilStartIndex = index
                    }
                    currentNilCount += 1
                    
                    if currentNilCount == chunkSize {
                        
                        break
                    }
                } else {
                    
                    nilStartIndex = nil
                    currentNilCount = 0
                }
            }
            
            // Move the chunk if a valid space was found
            if let startIndex = nilStartIndex, currentNilCount == chunkSize, lastValueIndex > startIndex {
                // Place the chunk into the nil space
                for i in 0..<chunkSize {
                    array[startIndex + i] = chunk[chunk.index(chunk.startIndex, offsetBy: i)]
                }
                
                // Clear the original chunk from the array
                for i in chunkStartIndex...lastValueIndex {
                    array[i] = nil
                    
                }
            }
        }
        
        return array
    }
    
    private static func checkSum(_ array: [Int?]) -> Int {
        var total = 0
        for i in 0..<array.count {
            if let value = array[i] {
                total = total + (i * value)
            }
        }
        
        return total
    }
    
    private static func createDisk(input: String) -> [Int?] {
        var diskMap: [Int?] = []
        let components = input.split(by: 2)
        for i in 0..<components.count {
            for _ in 0 ..< (Int(components[i][0]) ?? 0) {
                diskMap.append(i)
            }
            
            for _ in 0 ..< (Int(components[i][1]) ?? 0) {
                diskMap.append(nil)
            }
        }
        return diskMap
    }
}
