import Algorithms
import Common
import Foundation
import Regex

public struct Day7 {
    
    enum Card: Int {
        case Ace = 14
        case King = 13
        case Queen = 12
        case Jack = 11
        case ten = 10
        case nine = 9
        case eight = 8
        case seven = 7
        case six = 6
        case five = 5
        case four = 4
        case three = 3
        case two = 2
        case one = 1
        
        init(_ card2: Card2) {
            self = switch card2 {
            case .Ace: .Ace
            case .King:
                    .King
            case .Queen:
                    .Queen
            case .Joker:
                    .one
            case .ten:
                    .ten
            case .nine:
                    .nine
            case .eight:
                    .eight
            case .seven:
                    .seven
            case .six:
                    .six
            case .five:
                    .five
            case .four:
                    .four
            case .three:
                    .three
            case .two:
                    .two
            }
        }
        
        init(_ string: Character) {
            self = switch string {
            case "A": .Ace
            case "K": .King
            case "Q": .Queen
            case "J": .Jack
            case "T": .ten
            case "9": .nine
            case "8": .eight
            case "7": .seven
            case "6": .six
            case "5": .five
            case "4": .four
            case "3": .three
            case "2": .two
            default: fatalError()
                
            }
        }
    }
    
    enum Card2: Int {
        case Ace = 14
        case King = 13
        case Queen = 12
        case Joker = 1
        case ten = 10
        case nine = 9
        case eight = 8
        case seven = 7
        case six = 6
        case five = 5
        case four = 4
        case three = 3
        case two = 2
        
        init(_ string: Character) {
            self = switch string {
            case "A": .Ace
            case "K": .King
            case "Q": .Queen
            case "J": .Joker
            case "T": .ten
            case "9": .nine
            case "8": .eight
            case "7": .seven
            case "6": .six
            case "5": .five
            case "4": .four
            case "3": .three
            case "2": .two
            default: fatalError()
                
            }
        }
    }
    
    enum Hand: Int {
        case fiveOfAKind = 7
        case fourOfAKind = 6
        case fullHouse = 5
        case threeOfAKind = 4
        case twoPair = 3
        case onePair = 2
        case highCard = 1
    }
    
    public static func getAnswerPart1(input: [String]) throws -> Int {
        let sortedHands = input
            .map { row in
            let rowComponents = row.components(separatedBy: " ")
            let cards = rowComponents.first!.compactMap { Card($0) }
            return (cards, handType(from: cards), ( Int(rowComponents.last!)!))
        }
            .sorted { (array1, array2) -> Bool in
            if array1.1.rawValue > array2.1.rawValue {
                return false
            }
            
            if array1.1.rawValue < array2.1.rawValue {
                return true
            }
            
            let hand1Cards = array1.0
            let hand2Cards = array2.0
            
            for (value1, value2) in zip(hand1Cards, hand2Cards) {
                if value1 != value2 {
                    return value1.rawValue < value2.rawValue
                }
            }
            return true
        }
         
        return sortedHands.enumerated().map { (index, handAndBet) in
                handAndBet.2 * (index + 1)
                
            }
            .reduce(0, +)

    }
    
    private static func handType(from cards: [Card] ) -> Hand {
        let setCards = Set(cards)
        let setCount = setCards.count
        
        if setCount == 1 {
            return .fiveOfAKind
        }
        
        if setCount == 5 {
            return .highCard
        }
        
        if setCount == 2 {
            for card in setCards {
                if cards.filter({ $0 == card }).count == 4 {
                    return .fourOfAKind
                }
            }
            return .fullHouse
        }
        
        if setCount == 4 {
            return .onePair
        }
        
        if cards.filter({ $0.rawValue == cards[0].rawValue }).count == 3 ||
            cards.filter({ $0.rawValue == cards[1].rawValue }).count == 3 ||
            cards.filter({ $0.rawValue == cards[2].rawValue }).count == 3 {
            return .threeOfAKind
            
        }
        
        return .twoPair
    }
    
    private static func handType(from jokerCards: [Card2] ) -> Hand {
        let setCards = Set(jokerCards)
        let setCount = setCards.count
        
        if setCards.contains(.Joker) {
            if setCount == 1 {
                return .fiveOfAKind
            }
            
            var newHand: Hand = .highCard
            
            for card in setCards {
                let hand = handType(from: jokerCards.replacing([.Joker], with: [card]).map { Card($0) })
                if hand.rawValue > newHand.rawValue {
                    newHand = hand
                }
            }
            
            return newHand
        }
        
        return handType(from: jokerCards.map{ Card($0) })
    }
    
    public static func getAnswerPart2(input: [String]) throws -> Int {
        let sortedHands = input
            .map { row in
            let rowComponents = row.components(separatedBy: " ")
            let cards = rowComponents.first!.compactMap { Card2($0) }
            return (cards, handType(from: cards), ( Int(rowComponents.last!)!))
        }
            .sorted { (array1, array2) -> Bool in
            if array1.1.rawValue > array2.1.rawValue {
                return false
            }
            
            if array1.1.rawValue < array2.1.rawValue {
                return true
            }
            
            let hand1Cards = array1.0
            let hand2Cards = array2.0
            
            for (value1, value2) in zip(hand1Cards, hand2Cards) {
                if value1 != value2 {
                    return value1.rawValue < value2.rawValue
                }
            }
            return true
        }
         
        return sortedHands.enumerated().map { (index, handAndBet) in
                handAndBet.2 * (index + 1)
                
            }
            .reduce(0, +)

    }
}


