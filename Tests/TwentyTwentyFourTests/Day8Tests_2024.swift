//
//  Day8Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 8, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay8 {
    let input = Input.array(seperator: "\n", file: "Day8_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day8Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day8_part1Example() {
        #expect(Day8.getAnswerPart1(input: example) == 14)
    }
    
    @Test func test_day8_part1() {
        #expect(Day8.getAnswerPart1(input: input) == 327)
    }
    
    @Test func test_day8_part2_Example() {
        #expect(Day8.getAnswerPart2(input: example) == 31)
    }
    
    @Test func test_day8_part2() {
        #expect(Day8.getAnswerPart2(input: input) == 26407426)
    }
    
}
