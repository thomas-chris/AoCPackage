//
//  Day9Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 9, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay9 {
    let input = Input.array(seperator: "\n", file: "Day9_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day9Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day9_part1Example() {
        #expect(Day9.getAnswerPart1(input: example) == 50)
    }
    
    @Test func test_day9_part1() {
        #expect(Day9.getAnswerPart1(input: input) == 4790063600)
    }
    
    @Test func test_day9_part2_Example() {
        #expect(Day9.getAnswerPart2(input: example) == 24)
    }
    
    @Test func test_day9_part2() {
        #expect(Day9.getAnswerPart2(input: input) == 1516172795)
    }
    
}
