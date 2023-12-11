//
//  Collection+Extensions.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 03/12/2021.
//  Copyright © 2021 Chris Thomas. All rights reserved.
//

import Foundation

public extension Collection where Self.Iterator.Element: RandomAccessCollection {
    // PRECONDITION: `self` must be rectangular, i.e. every row has equal size.
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map{ $0[index] }
        }
    }

}

public extension Collection {
    func pairs() -> Array<(Element, Element)> {
        return Array(zip(self, dropFirst()))
    }
}

public extension Collection where Element: Collection, Element.Element: Equatable {
    func transpose() -> [[Element.Element]] {
        guard let rowCount = first?.count, allSatisfy({ $0.count == rowCount }) else {
            fatalError("All subarrays must have the same count")
        }

        var result = Array(repeating: [Element.Element](), count: rowCount)

        for i in indices {
            for (j, element) in self[i].enumerated() {
                result[j].append(element)
            }
        }

        return result
    }
}


public extension Array {
    mutating func rotate() -> Element? {
        
        guard let first = self.first else { return nil }
        
        var value = Array(self.dropFirst())
        value.append(first)
        self = value
        return first
    }
    
    mutating func rotate(by index: Int) -> Element? {
        var element: Element? = nil
        for _ in 1...index {
            element = rotate()
        }
        
        return element
    }
}

public extension ClosedRange {
    func isSuperset(of other: Self) -> Bool {
        return lowerBound <= other.lowerBound && upperBound >= other.upperBound
    }
}

public extension ClosedRange where Bound == Int {
    func split(over other: Self) -> Set<Self> {
        if other.isSuperset(of: self) {
            return [self]
        } else if lowerBound < other.lowerBound, upperBound > other.upperBound {
            return [
                (lowerBound ... other.lowerBound - 1),
                other,
                (other.upperBound + 1 ... upperBound)
            ]
        } else if other.lowerBound <= lowerBound {
            return [(lowerBound ... other.upperBound), (other.upperBound + 1 ... upperBound)]
        } else {
            return [(lowerBound ... other.lowerBound - 1), (other.lowerBound ... upperBound)]
        }
    }
    
    var magnitude: Int { abs(upperBound - lowerBound + 1) }
}
