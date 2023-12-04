import Algorithms
import Common
import Foundation
import Regex

public struct Day4 {
    
    public static func getAnswerPart1(input: [String]) throws -> Int {
        
        return try process(input)
        .map { (key, games) in
            let winningNumbers = games.first!
            let gameNumbers = games.last!
            
            let result = winningNumbers.filter { gameNumbers.contains($0) }.count
            return result
        }
        .filter{ matches in
            matches != 0
        }
        .map { matches in
            var result = 1
            for i in 1...matches {
                if i != 1 {
                    result *= 2
                }
            }
            return result
        }
        .reduce(0,+)
    }
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        
        let cards = try process(input)
        var dictionaryOfResults = [Int: Int]()
        
        cards.forEach { (key, games) in
            let winningNumbers = games.first!
            let gameNumbers = games.last!
            
            let result = winningNumbers.filter { gameNumbers.contains($0) }.count
            dictionaryOfResults[key] = result
        }
        
        var dictionaryOfCards = [Int: Int]()
        for i in 1...cards.count {
            dictionaryOfCards[i] = 1
        }
        
        for i in 1...input.count {
            if let numberOfCards = dictionaryOfCards[i] {
                    if let result = dictionaryOfResults[i],
                       result >= 1 {
                        for j in (1+i)...(result+i) {
                            for _ in 1...numberOfCards {
                            if let card = dictionaryOfCards[j] {
                                dictionaryOfCards[j] = card + 1
                            }
                        }
                    }
                }
            }
        }
        
        return dictionaryOfCards.values.reduce(0, +)
    }
    
    private static func process(_ input: [String]) throws -> [Int: [[Int]]] {
        let regex = try Regex(string: "\\s*([^;:|]+)")
        let numbers = try Regex(string: "\\d+")
        
        return input.reduce(into: [Int: [[Int]]]()) { partialResult, row in
            let sections = regex.allMatches(in: row).map { $0.matchedString }
            guard
                let game = numbers.firstMatch(in: sections[0])
            else { fatalError() }
            let winningNumbers = numbers.allMatches(in: sections[1]).map({ Int($0.matchedString)! })
            let ourNumbers = numbers.allMatches(in: sections[2]).map({ Int($0.matchedString)! })
            
            partialResult[Int(game.matchedString)!] = [winningNumbers, ourNumbers]
        }
    }
}


