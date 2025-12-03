//
//  Day3Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 3, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay3 {
    let input = Input.array(seperator: "\n", file: "Day3_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day3Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day3_part1Example() {
        #expect(Day3.getAnswerPart1(input: example) == 357)
    }
    
    @Test func test_day3_part1() {
        #expect(Day3.getAnswerPart1(input: input) == 17316)
    }
    
    @Test func test_day3_part2_Example() {
        #expect(Day3.getAnswerPart2(input: example) == 31)
    }
    
    @Test func test_day3_part2() {
        #expect(Day3.getAnswerPart2(input: input) == 26407426)
    }
    
}
