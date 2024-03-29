//
//  Math.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 05/12/2021.
//  Copyright © 2021 Chris Thomas. All rights reserved.
//

import Foundation

public func gcd(_ m: Int, _ n: Int) -> Int {
  var a = 0
  var b = max(m, n)
  var r = min(m, n)

  while r != 0 {
    a = b
    b = r
    r = a % b
  }
  return b
}

public func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

public func findLCM(of array: [Int]) -> Int {
    guard let first = array.first else {
        return 0 // or handle the case where the array is empty
    }

    return array.dropFirst().reduce(first) { currentLCM, element in
        lcm(currentLCM, element)
    }
}

public extension Array where Element == Int {
    func median() -> Double {
        let sortedArray = sorted()
        if count % 2 != 0 {
            return Double(sortedArray[count / 2])
        } else {
            return Double(sortedArray[count / 2] + sortedArray[count / 2 - 1]) / 2.0
        }
    }
}
