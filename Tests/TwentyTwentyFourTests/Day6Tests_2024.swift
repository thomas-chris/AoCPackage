//
//  Day6Tests_2024.swift
//  Tests for TwentyTwentyFour
//
//  This file contains test cases for Day 6, 2024.
//

import Testing
import TwentyTwentyFour
import Common
import XCTest

struct TestsDay6 {
    let input = Input.array(seperator: "\n", file: "Day6_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    let example = Input.array(seperator: "\n", file: "Day6Example_2024", bundle: .twentyTwentyFour, compactmap: { $0 })
    
    @Test func day6_part1Example() {
        #expect(Day6.getAnswerPart1(input: example) == 41)
    }
    
    @Test func test_day6_part1() {
        #expect(Day6.getAnswerPart1(input: input) == 4696)
    }
    
    @Test func test_day6_part2_Example() {
        #expect(Day6.getAnswerPart2(input: example) == 6)
    }
    
    /// Dont run, takes 7 hrs
//    @Test func test_day6_part2() {
//        #expect(Day6.getAnswerPart2(input: input) == 1443)
//    }
    
}
