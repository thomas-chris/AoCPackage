//
//  Day8Tests_2025.swift
//  Tests for TwentyTwentyFive
//
//  This file contains test cases for Day 8, 2025.
//

import Testing
import TwentyTwentyFive
import Common
import XCTest

struct TestsDay8 {
    let input = Input.array(seperator: "\n", file: "Day8_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day8Example_2025", bundle: .twentyTwentyFive, compactmap: { $0 })
    
    @Test func day8_part1Example() {
        #expect(Day8.getAnswerPart1(input: example, junctions: 10) == 40)
    }
    
    @Test func test_day8_part1() {
        #expect(Day8.getAnswerPart1(input: input, junctions: 1000) == 68112)
    }
    
    @Test func test_day8_part2_Example() {
        #expect(Day8.getAnswerPart2(input: example) == 25272)
    }
    
    @Test func test_day8_part2() {
        #expect(Day8.getAnswerPart2(input: input) == 44543856)
    }
    
}
