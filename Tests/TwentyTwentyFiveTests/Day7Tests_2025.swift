//
//  Day7Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 7, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay7 {
    let input = Input.array(seperator: "\n", file: "Day7_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day7Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day7_part1Example() {
        #expect(Day7.getAnswerPart1(input: example) == 21)
    }
    
    @Test func test_day7_part1() {
        #expect(Day7.getAnswerPart1(input: input) == 1681)
    }
    
    @Test func test_day7_part2_Example() {
        #expect(Day7.getAnswerPart2(input: example) == 40)
    }
    
    @Test func test_day7_part2() {
        #expect(Day7.getAnswerPart2(input: input) == 422102272495018)
    }
    
}
