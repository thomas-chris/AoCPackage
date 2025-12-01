//
//  Day5_2024.swift
//  Created for TwentyTwentyFour
//
//  This file contains the solution for Day 5, 2024.
//

import Foundation
@preconcurrency import Regex

public actor Day5 {
    static let part1Regex = Regex(#"(\d+)\|(\d+)"#)
    static let part2Regex =  Regex(#"^(?!.*\|)(\d+,)*\d+$"#)
    
    private static func instructionsAndList(_ input: [String]) -> ([Int: [Int]], [[Int]]) {
        var instructions: [Int: [Int]] = [:]
        var lists: [[Int]] = []
        for row in input {
            part1Regex.allMatches(in: row)
                .forEach { result in
                    var array = instructions[(Int(result.captures[0]!) ?? 0)] ?? []
                    array.append((Int(result.captures[1]!) ?? 0))
                    instructions[(Int(result.captures[0]!) ?? 0)] = array
                }
            
            if part2Regex.matches(row) {
                lists.append(row.components(separatedBy: ",").compactMap { Int(String($0).trimmingCharacters(in: .whitespaces)) })
                
            }
        }
        
        return (instructions, lists)
    }
    
    public static func getAnswerPart1(input: [String]) -> Int {
        let (instructions, lists) = instructionsAndList(input)
        var validMiddleNumbers: [Int] = []
        lists.forEach { list in
            var isValidList = true
            var reversedList = Array(list.reversed())
            while !reversedList.isEmpty {
                let number = reversedList.removeFirst()
                
                if
                    let instructionSet = instructions[number],
                    !Set(instructionSet).intersection(reversedList).isEmpty {
                    isValidList = false
                }
            }
            
            if isValidList {
                validMiddleNumbers.append(list[list.count / 2])
            }
        }
        
        return validMiddleNumbers.reduce(0, +)
    }

    public static func getAnswerPart2(input: [String]) -> Int {
        let (instructions, lists) = instructionsAndList(input)
        var middleNumbers: [Int] = []
        var newLists: [[Int]] = []
        lists.forEach { list in
            var isValidList = true
            var reversedList = Array(list.reversed())
            while !reversedList.isEmpty {
                let number = reversedList.removeFirst()
                
                if
                    let instructionSet = instructions[number],
                    !Set(instructionSet).intersection(reversedList).isEmpty {
                    isValidList = false
                }
            }
            
            if !isValidList {
                let newList = fixList(list, with: instructions)
                newLists.append(newList)
                middleNumbers.append(newList[newList.count / 2])
            }
        }
        
        return middleNumbers.reduce(0, +)
    }
    
    private static func fixList(_ list: [Int], with instructions: [Int: [Int]]) -> [Int] {
        var reversedList = Array(list.reversed())
        var newReversedList: [Int] = []
        var appendAtEnd: [Int] = []
        while !reversedList.isEmpty {
            let number = reversedList.removeFirst()
            
            if let instructionSet = instructions[number]
            {
                let intersection = Set(instructionSet).intersection(reversedList)
                if intersection.isEmpty {
                    newReversedList.append(number)
                } else {
                    let firstIntersection = intersection.first!
                    let index = reversedList.firstIndex(of: firstIntersection)!
                    reversedList.insert(number, at: index + 1)
                }
            } else {
                appendAtEnd.append(number)
            }
        }
        return Array(newReversedList.reversed()) + appendAtEnd
    }
}
