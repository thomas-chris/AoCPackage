//
//  Day5Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 5, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay5 {
    let input = Input.array(seperator: "\n", file: "Day5_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day5Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day5_part1Example() {
        #expect(Day5.getAnswerPart1(input: example) == 143)
    }
    
    @Test func test_day5_part1() {
        #expect(Day5.getAnswerPart1(input: input) == 5374)
    }
    
    @Test func test_day5_part2_Example() {
        #expect(Day5.getAnswerPart2(input: example) == 123)
    }
    
    @Test func test_day5_part2() {
        #expect(Day5.getAnswerPart2(input: input) == 4260)
    }
    
}
