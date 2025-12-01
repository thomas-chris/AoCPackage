//
//  Day10Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 10, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay10 {
    let input = Input.array(seperator: "\n", file: "Day10_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day10Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day10_part1Example() {
        #expect(Day10.getAnswerPart1(input: example) == 36)
    }
    
    @Test func test_day10_part1() {
        #expect(Day10.getAnswerPart1(input: input) == 3569916)
    }
    
    @Test func test_day10_part2_Example() {
        #expect(Day10.getAnswerPart2(input: example) == 31)
    }
    
    @Test func test_day10_part2() {
        #expect(Day10.getAnswerPart2(input: input) == 26407426)
    }
    
}
